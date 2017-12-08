class Location < ApplicationRecord
  def self.q1
    find_by_sql("select county_name
                from locations
                join
                (select c1.county_fips as fips
                from (select count(*) as tot, county_fips
                    from located_at
                    group by county_fips) c1,
                    (select MAX(tot) as maxtot
                    from (select count(*) as tot, county_fips from located_at
                group by county_fips)) c2
                where c1.tot = c2.maxtot)
                on county_fips = fips
                group by county_name")
    end

    def self.q2
      find_by_sql("SELECT county_name, COALESCE(SUM(dui),0) as dui_count
                  FROM locations
                  LEFT JOIN
                  (SELECT county_fips as fips, COUNT(*) as dui
                  FROM violations v
                  JOIN located_at l ON
                  v.violation_id = l.violation_id
                  WHERE violation_type LIKE 'DUI'
                  GROUP BY county_fips)
                  ON county_fips = fips
                  GROUP BY county_name
                  ORDER BY COALESCE(SUM(dui),0) DESC")
    end

    def self.q3
      find_by_sql("SELECT * FROM
                  (SELECT county, speed_count, RANK() OVER (ORDER BY speed_count DESC) as rank
                  FROM
                  (SELECT county, COUNT(v_type) as speed_count
                  FROM
                  ( SELECT DISTINCT county_name as county, located_at.violation_id as v_id, violation_type as v_type
                  FROM located_at
                  JOIN locations ON
                  located_at.county_fips = locations.county_fips
                  JOIN violations ON
                  located_at.violation_id = violations.violation_id )
                  WHERE v_type LIKE 'Speeding'
                  GROUP BY county))
                  WHERE RANK <= 5")
    end
end

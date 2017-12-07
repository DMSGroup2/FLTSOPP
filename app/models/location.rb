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
      find_by_sql("select county_name, COALESCE(sum(dui),0) as dui_count
                  from locations
                  left join
                  (select county_fips as fips, count(*) as dui
                  from violations v
                  join located_at l on
                  v.violation_id = l.violation_id
                  where violation_type LIKE 'DUI'
                  group by county_fips)
                  on county_fips = fips
                  group by county_name
                  order by COALESCE(sum(dui),0) desc")
    end
end

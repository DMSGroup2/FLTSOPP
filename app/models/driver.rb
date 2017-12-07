class Driver < ApplicationRecord

  def self.q1
    find_by_sql("select cnt1.driver_race
                from (select count(*) as total, driver_race
                    from located_at
                    group by driver_race) cnt1,
                    (select MAX(total) as maxtotal
                    from (select count(*) as total, driver_race from located_at
                group by driver_race)) cnt2
                where cnt1.total = cnt2.maxtotal")
  end

  def self.q2
    find_by_sql("select race2, COALESCE(dui_count,0) as dui_count, speed_count
                from
                (select driver_race as race2, count(*) as speed_count
                from stops
                join violations on
                stops.violation_id = violations.violation_id
                where violation_type like 'Speeding'
                AND driver_race is not null
                group by driver_race)
                left join
                (select driver_race as race1, count(*) as dui_count
                from stops
                join violations on
                stops.violation_id = violations.violation_id
                where violation_type like 'DUI'
                AND driver_race is not null
                group by driver_race)
                on race2 = race1")
  end
end

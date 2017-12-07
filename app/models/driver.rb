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
end

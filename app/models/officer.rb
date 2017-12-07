class Officer < ApplicationRecord
  def self.q1
    find_by_sql("select gender1, warning, citation
                from
                (select officer_gender as gender1, count(*) * 100.0 / sum(count(*)) over() as warning
                from officers
                join gives on
                officers.officer_id = gives.officer_id
                join violations on
                gives.violation_id = violations.violation_id
                where stop_outcome = 'Warning'
                AND officer_gender is not null
                group by officer_gender)
                join
                (select officer_gender gender2, count(*) * 100.0 / sum(count(*)) over() as citation
                from officers
                join gives on
                officers.officer_id = gives.officer_id
                join violations on
                gives.violation_id = violations.violation_id
                where stop_outcome = 'Citation'
                AND officer_gender is not null
                group by officer_gender)
                on gender1 = gender2")
  end
end

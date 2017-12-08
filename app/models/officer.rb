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

  def self.q2
    find_by_sql("SELECT
        officers.officer_race as race,
        STATS_MODE(violations.violation_type) AS v_type
    FROM
        located_at
        INNER JOIN violations ON located_at.violation_id = violations.violation_id
        INNER JOIN officers ON located_at.officer_id = officers.officer_id
    WHERE officer_race IS NOT NULL
    GROUP BY
        officers.officer_race")
    end
end

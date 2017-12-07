class Violation < ApplicationRecord
  def self.q1
    find_by_sql("select * from
                (select violation_type, count(*) as v_count
                from violations
                where violation_type like 'Lights'
                group by violation_type
                UNION
                select violation_type, count(*)
                from violations
                where violation_type like 'Paperwork'
                group by violation_type
                UNION
                select violation_type, count(*)
                from violations
                where violation_type like 'Registration/plates'
                group by violation_type
                UNION
                select violation_type, count(*)
                from violations
                where violation_type like 'Safe movement'
                group by violation_type
                UNION
                select violation_type, count(*)
                from violations
                where violation_type like 'Speeding'
                group by violation_type
                UNION
                select violation_type, count(*)
                from violations
                where violation_type like 'Seat belt'
                group by violation_type
                UNION
                select violation_type, count(*)
                from violations
                where violation_type like 'Equipment'
                group by violation_type
                UNION
                select violation_type, count(*)
                from violations
                where violation_type like 'DUI'
                group by violation_type
                UNION
                select violation_type, count(*)
                from violations
                where violation_type like 'Other'
                group by violation_type
                UNION
                select violation_type, count(*)
                from violations
                where violation_type like 'License'
                group by violation_type)
                order by v_count desc")
  end
end

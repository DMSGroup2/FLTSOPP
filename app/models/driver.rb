class Driver < ApplicationRecord

  def self.lastone
    find_by_sql("SELECT * FROM
          (SELECT DRIVERS.* FROM DRIVERS ORDER BY DRIVERS.VIOLATION_ID ASC )
          WHERE ROWNUM <= 10")
  end
end

FactoryGirl.define do
  factory :db_locker do
    is_locked ""
    lock_time "2016-08-16 10:52:51"
    locked_by "MyString"
  end
end

FactoryGirl.define do
  factory :response do
    version 1
    offset 1
    suffix "MyString"
    localtime "9 May 2017 18:50:33"
    isotime "2017-05-09 18:50:33 -0500"
    utctime "2017-05-09 23:50:33"
    dst "unknown"
    time_request nil
  end
end

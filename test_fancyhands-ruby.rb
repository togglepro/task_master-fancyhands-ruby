require 'fancyhands'

f = Fancyhands.new("YOUR_API_KEY", "YOUR_API_SECRET", "http://localhost:8080/api/v1/")

puts f.echo({ :somedata => "here's yer data" })

puts f.custom_post("From ruby", "some description", 1.0, nil, {})
puts f.custom_get("ahJkZXZ-ZmFuY3loYW5kcy1ocmRyKQsSBkZIVXNlchiAgICAgICACgwLEglGSFJlcXVlc3QYgICAgIDAnwgM")

r =  f.standard_post("From ruby", "some description", 1.0, nil)
k = r["key"]
f.message_post(k, "This is other message")
print k
puts f.standard_get(k)

conversation = {
  :id => "sample_conversation",
  :data =>  nil,
  :name =>  "Sample Conversation",
  :version =>  1.1,
  :scripts =>  [
    {
      :id =>  "start",
      :steps =>  [
        {
          :name =>  "time",
          :prompt =>  "What time is it?",
          :note =>  "The recording will tell you a time. What time is it?",
          :type =>  "text",
          :options =>  []
        },
        {
          :name =>  "transfer",
          :type =>  "logic_control",
          :note =>  "",
          :prompt =>  "OK, transferring you now.",
          :options =>  [
            {
              :name =>  "Trasnsfer",
              :result =>  "-- Transfer Call --"
            }
          ]
        }
      ],
      :transfer_number =>  "815-455-3440"
    }
  ]
}

r =  f.call_post("646-330-0181", conversation)
puts r

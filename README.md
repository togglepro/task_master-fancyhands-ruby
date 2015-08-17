# task_master-fancyhands-ruby

**This is a fork of the [official Ruby client for FancyHands](https://github.com/fancyhands/fancyhands-ruby). A couple of key bugs are fixed already, but the library will certainly change much more. Feel free to use it but know that other changes will be coming. I may also refactor the interfaces to make the code more idiomatic Ruby and add tests, but haven't done that yet.**

This is our first pass at a ruby library / SDK.

We'd gladly accept any pull requests or advice.

This includes code for all of the Fancy Hands endpoints including:
 - fancyhands.call.Outgoing
 - fancyhands.call.Incoming
 - fancyhands.call.Number
 - fancyhands.call.History
 - fancyhands.echo.Echo
 - fancyhands.echo.Echo
 - fancyhands.standard.Standard
 - fancyhands.standard.Message
 - fancyhands.custom.Custom


# Installing it

`gem install task_master-fancyhands-ruby`

# Using it

```ruby
require 'task_master-fancyhands'
Fancy = FancyHands::V1::Client.new("YOUR API KEY", "YOUR API SECRET")
# creating and loading a standard request
s = Fancy.Standard.post("A simple request from Ruby", "Yada yada", 3.0)
puts "Created request, loading it again"
puts Fancy.Standard.get(s["key"])
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
      :transfer_number =>  "815-555-1212"
    }
  ]
}

r =  Fancy.Call.post("815-455-3440", conversation)
puts "Created call!"
```

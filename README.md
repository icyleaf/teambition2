# Teambition2

非官方 Teambition API SDK Ruby 版本。除了通用的请求以外，还简单封装了部分任务接口。

## 安装

Add this line to your application's Gemfile:

```ruby
gem 'teambition2'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install teambition2

## 用法

```ruby
require 'teambition2'

# 初始化
client = Teambition2::Client.new "client_key", "client_secret", "callback_uri"

# 获取认证链接
client.authorize_url

# 获取令牌
client.access_token "code"

# 检查令牌是否有效
client.valid_token?

# 获取项目列表
client.projects

# 获取项目的任务分组列表
client.task_group "project_id"

# 在指定任务分组创建一个任务
client.create_task "group_id", "subject"
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/teambition2. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Teambition2 project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/teambition2/blob/master/CODE_OF_CONDUCT.md).

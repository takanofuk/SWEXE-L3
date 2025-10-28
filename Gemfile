source "https://rubygems.org"

# Rails本体
gem "rails", "~> 8.1.0"

# Webサーバ・アセット管理
gem "puma", ">= 5.0"
gem "propshaft"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "jbuilder"

# 本番用データベース
gem "pg", group: :production

# Active Job / Action Cable 用
gem "solid_cache"
gem "solid_queue"
gem "solid_cable"

# キャッシュ高速化
gem "bootsnap", require: false

# デプロイ支援
gem "kamal", require: false
gem "thruster", require: false

# Windows向けタイムゾーン情報
gem "tzinfo-data", platforms: %i[windows jruby]

# 開発環境専用
#gem "sqlite3" #, group: :development       # 開発用DB

#group :development do
#  gem "web-console"             # 例外ページでのコンソール
#  gem "debug", platforms: %i[mri windows], require: "debug/prelude"
#end

# テスト環境専用
group :test do
  gem "capybara"
  gem "selenium-webdriver"
end

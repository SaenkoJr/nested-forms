install:
	bundle install
	yarn install

start:
	bin/rails s -p 3000 -b "0.0.0.0"

console:
	bin/rails console

test:
	bin/rails db:migrate RAILS_ENV=test
	bin/rails test $(CURDIR)/test/hexlet_check

.PHONY: test

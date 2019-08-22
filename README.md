# Ruby on Rails - Intermediate Ruby on Rails - Testing with RSpec - Project

## Use describe and context to structure Employee model specs

Inside the employee model spec, define a structure to separate the tests for Validations, Attributes, Scopes and Instance Methods. Use either `describe` or `context`.

## Write model specs for Employee

### Validations

1. Test that an employee can be valid when properly set up.
2. Test that an employee is invalid without a `first_name`.
3. Test that an employee is invalid without a `last_name`

### Attributes

1. Test that an employee has exactly the expected attributes

### Scopes

1. Test that the `zero_balance` scope returns expected results from the database.
2. Make sure that the database has at least one record in it that should *not* be returned by the `zero_balance` scope.
3. Make sure that the database has at least two records in it that should be returned by the `zero_balance` scope.

### Instance Methods

1. Test that the `full_name` method returns expected results
   - Since we validate `first_name` and `last_name`, there is only one context to cover
   - Test that the `can_afford?` method returns expected results
     - Cover the affordable context and the unaffordable context

## Write a request spec for creating an Employee

The `spec/requests/create_employee_spec.rb` needs to be completed by testing that the employee is successfully created and has the expected values and is returned as JSON from the endpoint.

1. Write expectation on the status code.
2. Write an expecation on the values submitted via the body of the request.

## Write isolated tests for RewardsReport

We want to write a spec for the RewardsReport#notify method. This method calls an external service that is expensive and we want to use a spy to prevent that call but still assert that it takes place. The value sent to the external service is based on the `total_purchases` method which is built by summing all the initial rewards `purchase_counts`. Use an array of reward doubles that stub their `purchase_counts` in order to specify the total sent to the NotificationService.

1. Instantiate the RewardsReport with an array of 3 reward doubles. Set the 3 doubles to have purchase counts of 30, 70, and 100 respectively.
2. Write an isolated spec for the `.notify` instance method of RewardsReport.
3. Use a Spy to allow and then expect the method that is called and the value it is called with.
4. Assert that the spy received the value 200 (the total of our doubles) as a parameter to the `send_purchase_report` method.

Init -- Brad Mortensen

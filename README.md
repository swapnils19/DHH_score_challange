# DHH Score challenge statement -

- Find out the score of public `Github` events provided by the `Github API` for a user `DHH`
- The scoring pattern per event can be as follows -

```json
IssuesEvent => 7
IssueCommentEvent => 6
PushEvent => 5
PullRequestReviewCommentEvent => 4
WatchEvent => 3
CreateEvent => 2
Any other event => 1
```

# Solution

- This excercise is built using `ruby 2.6.3`
- This can be run using plain Ruby; no external gems/libraries required

## To run this excercise -

```shell
ruby dhh_score.rb
```

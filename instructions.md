Add authorize_request and current_user behavior to ApplicationController.

Require a bearer token for task endpoints.

Scope the task index to current_user.tasks.

Create tasks through current_user.tasks rather than accepting an arbitrary user_id.

Prevent a user from showing, updating, or deleting another user's task.

Test missing, invalid, and valid tokens with two users in HTTPie.
SimpleRoles.configure do
  valid_roles :agent, :editor, :accountant, :admin
  strategy :many # Default is :one
end
# Re-use the same ssh-agent process over session
# Start ssh-agent if it isn't running

set SSH_AUTH_SOCK $HOME/.ssh/ssh-agent.sock

ssh-add -l 2>/dev/null >/dev/null
if test $status -ge 2
  eval (ssh-agent -a "$SSH_AUTH_SOCK" -c -t 20)
end

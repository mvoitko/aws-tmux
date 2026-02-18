# aws-tmux - A bit of AWS in your tmux

:warning: This is a work in progress. This is **Not** AWS project or product in any form or shape.

![scr](img/header.png)

`aws-tmux` is a simple AWS helper plugin that can do the following:
- Show the version of AWS CLI currently installed
- Display the region currently configured (in the current aws cli profile)
- Show the status of the selected CloudFormation template (WIP).
- Display the current AWS profile name
- Show the active SSO session name

The prerequisites for this `tmux` status indicator to work is that you have the
following:

- [AWS CLI](https://aws.amazon.com/cli/) (configured)
- [fzf](https://github.com/junegunn/fzf)
- [jq](https://stedolan.github.io/jq/)

To use this plugin, clone the repo into the `$HOME/.tmux` directory. This does
nothing on its own, so you need to add some things to your tmux configuration.
There are three options currently available to be displayed in tmux:
- AWS Region `#{aws_region}`
- AWS CLI version `#{aws_version}`
- CloudFormation stack status `#{aws_cfn_status}`
- AWS Profile `#{aws_profile}`
- SSO Session Name `#{aws_sso_session}`

## Installation

### Tmux Plugin Manager (TPM) - Recommended
If you are using [TPM](https://github.com/tmux-plugins/tpm) just add the
following line to the plugin section of your `.tmux.conf` file:

```bash
set -g @plugin 'darko-mesaros/aws-tmux'
```

Reload your tmux configuration and update your TPM plugins (Prefix + U), and you
should have aws-tmux available. :rocket:

### Manual
Clone this repository in your `$HOME/.tmux/` directory:

```bash
git clone https://github.com/darko-mesaros/aws-tmux.git $HOME/.tmux/plugins/aws-tmux
```
Add the following line to the bottom of your `.tmux.conf` file:

```bash
run $HOME/.tmux/plugins/aws-tmux/aws.tmux
```

## Configuration 

You can add those things to your status bar configuration like so:
```bash
set-option -g status-right "#[fg=colour239, bg=colour221]CFN: #{aws_cfn_status} #[fg=colour239, bg=colour214] CLI: v:#{aws_version} Region: #{aws_region} "
```
But you are free to arrange these as you please!

Note: to make sure that the status is kept up-to-date automatically, add the
following to your `~/.tmux.conf` (here: refresh every 5 seconds):

```bash
tmux set status-interval 5
```

### CloudFormation Support (BETA):
To get the information on the status of your CloudFormation stack (eg. has it
deployed successfully) you need to first select the cloudformation template.
This will be saved in a configuration option `@aws-cfn-stackname`.

To select the stack, use the default key binding `Prefix + u`.
If you wish to change this, add this to your `.tmux.conf`:

```bash
set -gq @aws-cfn-list 'YOURKEY'
```

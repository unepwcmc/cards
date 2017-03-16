# Import all plugins from `rel/plugins`
# They can then be used by adding `plugin MyPlugin` to
# either an environment, or release definition, where
# `MyPlugin` is the name of the plugin module.
Path.join(["rel", "plugins", "*.exs"])
|> Path.wildcard()
|> Enum.map(&Code.eval_file(&1))

use Mix.Releases.Config,
    # This sets the default release built by `mix release`
    default_release: :default,
    # This sets the default environment used by `mix release`
    default_environment: Mix.env()

# For a full list of config options for both releases
# and environments, visit https://hexdocs.pm/distillery/configuration.html


# You may define one or more environments in this file,
# an environment's settings will override those of a release
# when building in that environment, this combination of release
# and environment configuration is called a profile

environment :dev do
  set dev_mode: true
  set include_erts: false
  set cookie: :"O(0HZJ$j9WA20awNh5V0ygNU(v$:f4E{~8&<zdP=A4?BrW.Z[OC6g7m2y2CZTM4X"
end

environment :prod do
  set include_erts: true
  set include_src: false
  set cookie: :"2bpG|.VkS!mbDeH&T[BqS.U?.3SENG[hY1<U])tZ6sq5|H|n*Uh{BNG).I%Iexx8"
end

# You may define one or more releases in this file.
# If you have not set a default release, or selected one
# when running `mix release`, the first release in the file
# will be used by default

release :cards_umbrella do
  set version: "0.3.1"

  # set port for distributed erlang. This allows nodes to connect to
  # each other (useful for using :observer from another machine)
  set erl_opts: "-kernel inet_dist_listen_min 9001 inet_dist_listen_max 9001"

  set applications: [
    runtime_tools: :permanent,
    wx: :permanent,
    observer: :permanent,

    cards: :permanent,
    cards_web: :permanent
  ]
end

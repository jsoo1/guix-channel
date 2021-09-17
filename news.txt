(channel-news
 (version 0)
 (entry
  (commit "711e004ed8210ee65e8eac2dc644294ce3fe1b9c")
  (title (en "Developed branch changed to release"))
  (body (en "The \"master\" branch will not be updated going forward.
Use the \"release\" branch instead")))
 (entry
  (commit "283765c97479f19f8ab35918c218b9e595021f08")
  (title (en "Committing to stability."))
  (body (en "Breaking changes will be made in branches.")))
 (entry
  (commit "5f953598387088250bea4dd0ca494ffc41098703")
  (title (en "Dhall submitted upstream."))
  (body (en "Dhall moved out of this repo into patches upstream.

See issue at @url{https://issues.guix.gnu.org/issue/40557}")))
 (entry
  (commit "9f086413c335bf01f8b48f62fdc017a6fb7a3f0c")
  (title (en "Cargo removed from channel."))
  (body (en "Cargo was added in ignorance of how to install different
outputs from a package.

To get cargo, use @command{guix package -i rust:cargo}"))))

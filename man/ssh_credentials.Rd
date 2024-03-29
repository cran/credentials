% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ssh-keys.R
\name{ssh_credentials}
\alias{ssh_credentials}
\alias{ssh_key_info}
\alias{ssh_keygen}
\alias{ssh_setup_github}
\alias{ssh_home}
\alias{ssh_agent_add}
\alias{ssh_update_passphrase}
\alias{ssh_read_key}
\title{Managing Your SSH Key}
\usage{
ssh_key_info(host = NULL, auto_keygen = NA)

ssh_keygen(file = ssh_home("id_ecdsa"))

ssh_setup_github()

ssh_home(file = NULL)

ssh_agent_add(file = NULL)

ssh_update_passphrase(file = ssh_home("id_rsa"))

ssh_read_key(file = ssh_home("id_rsa"), password = askpass)
}
\arguments{
\item{host}{target host (only matters if you have configured specific keys per host)}

\item{auto_keygen}{if \code{TRUE} automatically generates a key if none exists yet.
Default \code{NA} is to prompt the user what to.}

\item{file}{destination path of the private key. For the public key, \code{.pub}
is appended to the filename.}

\item{password}{a passphrase or callback function}
}
\description{
Utility functions to find or generate your SSH key for use with git remotes
or other ssh servers.
}
\details{
Use \code{\link[=ssh_key_info]{ssh_key_info()}} to find the appropriate key file on your system to connect with a
given target host. In most cases this will simply be \code{ssh_home('id_rsa')} unless
you have configured ssh to use specific keys for specific hosts.

To use your key to authenticate with GitHub, copy the pubkey from \code{ssh_key_info()} to
your profile: \url{https://github.com/settings/ssh/new}.

If this is the first time you use ssh, \link{ssh_keygen} can help generate a key and
save it in the default location. This will also automatically opens the above Github
page in your browser where you can add the key to your profile.

\code{ssh_read_key} reads a private key and caches the result (in memory) for the
duration of the R session. This prevents having to enter the key passphrase many
times. Only use this if \code{ssh-agent} is not available (i.e. Windows)
}
\seealso{
Other credentials: 
\code{\link{http_credentials}}
}
\concept{credentials}

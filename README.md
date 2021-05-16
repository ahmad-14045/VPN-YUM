# SSH-TUNNELING-FOR-YUM
Auto Script For SSH &amp; OpenVPN Centos & Fedora

# Usage :
> wget https://raw.githubusercontent.com/wildyproject/VPN-YUM/main/autostart.sh && chmod +x autostart.sh && ./autostart.sh


    
<button type="button" onclick="copy_text()">Copy</button>

    
wget https://raw.githubusercontent.com/wildyproject/VPN-YUM/main/autostart.sh && chmod +x autostart.sh && ./autostart.sh "

<div class="snippet-clipboard-content position-relative" data-snippet-clipboard-copy-content="  -v                 Verbose output.
  -o 'OPTIONS'       Allows for setting script variables on the
                     command line. Must be in the following format...
                     'OPTION1=&quot;OPTIONARG1&quot;;OPTION2=&quot;OPTIONARG2&quot;'
  -d '+var;-var;var' Allows for setting what information is displayed
                     on the command line. You can add displays with +var,var. You
                     can delete displays with -var,var. Setting without + or - will
                     set display to that explicit combination. Add and delete statements
                     may be used in conjunction by placing a ; between them as so:
                     +var,var,var;-var,var.
  -n                 Do not display ASCII distribution logo.
  -N                 Strip all color from output.
  -w                 Wrap long lines.
  -t                 Truncate output based on terminal width (Experimental!).
  -p                 Output in portrait mode, with logo above info.
  -s [-u IMGHOST]    Using this flag tells the script that you want it
                     to take a screenshot. Use the -m flag if you would like
                     to move it to a new location afterwards.
  -c string          You may change the outputted colors with -c. The format is
                     as follows: [0-9][0-9],[0-9][0-9]. The first argument controls the
                     ASCII logo colors and the label colors. The second argument
                     controls the colors of the information found. One argument may be
                     used without the other.
  -a 'PATH'          You can specify a custom ASCII art by passing the path
                     to a Bash script, defining `startline` and `fulloutput`
                     variables, and optionally `labelcolor` and `textcolor`.
                     See the `asciiText` function in the source code for more
                     information on the variables format.
  -S 'COMMAND'       Here you can specify a custom screenshot command for
                     the script to execute. Surrounding quotes are required.
  -D 'DISTRO'        Here you can specify your distribution for the script
                     to use. Surrounding quotes are required.
  -A 'DISTRO'        Here you can specify the distribution art that you want
                     displayed. This is for when you want your distro
                     detected but want to display a different logo.
  -E                 Suppress output of errors.
  -C                 Add custom (extra) lines.
                     For example:
                           screenfetch -C 'IP WAN=192.168.0.12,IP BRIDGED=10.1.1.10'
                     ... will add two extra lines:
                           IP WAN: 192.168.0.12
                           IP BRIDGED: 10.1.1.10
  -V, --version      Display current script version.
  -h, --help         Display this help.
"><pre><code>  -v                 Verbose output.
  -o 'OPTIONS'       Allows for setting script variables on the
                     command line. Must be in the following format...
                     'OPTION1="OPTIONARG1";OPTION2="OPTIONARG2"'
  -d '+var;-var;var' Allows for setting what information is displayed
                     on the command line. You can add displays with +var,var. You
                     can delete displays with -var,var. Setting without + or - will
                     set display to that explicit combination. Add and delete statements
                     may be used in conjunction by placing a ; between them as so:
                     +var,var,var;-var,var.
  -n                 Do not display ASCII distribution logo.
  -N                 Strip all color from output.
  -w                 Wrap long lines.
  -t                 Truncate output based on terminal width (Experimental!).
  -p                 Output in portrait mode, with logo above info.
  -s [-u IMGHOST]    Using this flag tells the script that you want it
                     to take a screenshot. Use the -m flag if you would like
                     to move it to a new location afterwards.
  -c string          You may change the outputted colors with -c. The format is
                     as follows: [0-9][0-9],[0-9][0-9]. The first argument controls the
                     ASCII logo colors and the label colors. The second argument
                     controls the colors of the information found. One argument may be
                     used without the other.
  -a 'PATH'          You can specify a custom ASCII art by passing the path
                     to a Bash script, defining `startline` and `fulloutput`
                     variables, and optionally `labelcolor` and `textcolor`.
                     See the `asciiText` function in the source code for more
                     information on the variables format.
  -S 'COMMAND'       Here you can specify a custom screenshot command for
                     the script to execute. Surrounding quotes are required.
  -D 'DISTRO'        Here you can specify your distribution for the script
                     to use. Surrounding quotes are required.
  -A 'DISTRO'        Here you can specify the distribution art that you want
                     displayed. This is for when you want your distro
                     detected but want to display a different logo.
  -E                 Suppress output of errors.
  -C                 Add custom (extra) lines.
                     For example:
                           screenfetch -C 'IP WAN=192.168.0.12,IP BRIDGED=10.1.1.10'
                     ... will add two extra lines:
                           IP WAN: 192.168.0.12
                           IP BRIDGED: 10.1.1.10
  -V, --version      Display current script version.
  -h, --help         Display this help.
</code></pre></div>
<h2><a id="user-content-contact-me" class="anchor" aria-hidden="true" href="#contact-me"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M7.775 3.275a.75.75 0 001.06 1.06l1.25-1.25a2 2 0 112.83 2.83l-2.5 2.5a2 2 0 01-2.83 0 .75.75 0 00-1.06 1.06 3.5 3.5 0 004.95 0l2.5-2.5a3.5 3.5 0 00-4.95-4.95l-1.25 1.25zm-4.69 9.64a2 2 0 010-2.83l2.5-2.5a2 2 0 012.83 0 .75.75 0 001.06-1.06 3.5 3.5 0 00-4.95 0l-2.5 2.5a3.5 3.5 0 004.95 4.95l1.25-1.25a.75.75 0 00-1.06-1.06l-1.25 1.25a2 2 0 01-2.83 0z"></path></svg></a>Contact Me</h2>
<p>If you would like to suggest something new, inform me of an issue in the
script, become part of the project, or talk to me about anything else,
you can either email me at <code>screenfetch@kittykatt.co</code> or you can connect
to Rizon and reach me at <code>irc://irc.rizon.net/screenFetch</code></p>
</article>
        </div>
    </div>

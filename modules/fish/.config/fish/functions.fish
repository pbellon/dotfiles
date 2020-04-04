# fenction :e
#     emacsclient -e "
# end
function default
  for val in $argv
    if test "$val" != ""
      echo $val
      break
    end
  end
end

function reload-fish
    source ~/.config/fish/config.fish
end

function lln
    ls -AlGg
end

function ls-emacs-tmp-files
    set path (default $argv[1] ".")
    find $path \( -name "#*" -o -name "\.#*" -o -name "\.*~" -o -name "*~" \)
end

function rm-emacs-tmp-files
    set files (ls-emacs-tmp-files $argv[1])
    if count $files > 0
        echo -e "Found these temporary files:\n\t$files"
        read -l -P 'Found these temporary emacs files, do you want to delete them? [y/N] ' confirm
        switch $confirm
            case Y y
                echo removed (count $files) files
                rm $files
            case '' N n
                echo "No files removed"
        end
    else
        echo "No temporary files found"
    end
end

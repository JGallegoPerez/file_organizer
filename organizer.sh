#!/bin/bash

# Bash script to organize files more easily.

pwd=$(pwd)
echo The current directory is $pwd

while true; do
    #clear
    echo -e "\nMenu:"
    echo "Press 1 to view files. "
    echo "Press 2 to delete files. "
    echo "Press 3 to move files. "
    read -p "Press q to quit: " choice
    case "$choice" in
        1)
	    read -p "Press 1 to list the largest files overall. Press 2 to view the files ending with a specific extension: " choice1
	    case "$choice1" in
		1)
                    read -p "Specifiy the number of files you would like to list: " num_files
	            echo -e "\nSIZE:    FILE:"
	            find . -type f -exec du -h {} + | sort -rh | head -n $num_files
                    ;;
		2)
		    read -p "Specifiy the extension of the files you would like to list. Don't add the dot (.): " list_ext
		    echo -e "\nFILES FOUND"
		    find . -type f -name "*.$list_ext"
		    ;;
	    esac
            ;;
	2)
            read -p "Press 1 to delete a specific file. Press 2 to delete all files ending with a specific extension: " choice2
            case "$choice2" in
                1)
                    read -p "Specifiy the file you want to delete (relative path included): " del_file
                    rm $del_file
                    ;;
                2)
                    read -p "Specify the extension to delete files recursively, from the current directory. Don't add the dot (.): " del_ext
		    find . -type f -name "*.$del_ext" -exec rm {} \;
		    ;;
            esac
            ;;

	3)
	    read -p "Press 1 move a specific file. Press 2 to move all files ending with a specific extension: " choice3
	    case "$choice3" in
		1)
                    read -p "First, specifiy the file you want to move (relative path included): " move_file
	            read -p "Now, specify the directory (with relative path) to which the file will be moved: " move_dir1
	            mv $move_file $move_dir1 
                    ;;
		2)
                    read -p "First, specifiy the extension of the files you want to move. Don't add the dot (.): " move_ext
	            read -p "Now, specify the directory (with relative path) to which the files will be moved: " move_dir2
	            find . -type f -name "*.$move_ext" -exec mv {} $move_dir2 \;
                    ;;
	    esac
            ;;	    
        q)
            break
            ;;
        *)
            echo "Invalid choice. Press any key to continue..."
            read -n 1 -s -r
            ;;
    esac
done



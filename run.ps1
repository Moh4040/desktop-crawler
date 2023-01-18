# set the directory you want to search
$directory = "C:\Users\username\Desktop"

# initialize an empty array to store file/folder information
$files = @()

# use Get-ChildItem to get all files and folders in the directory
$items = Get-ChildItem -Path $directory -Recurse

# iterate through the items
foreach ($item in $items) {
    # create a new object to store the file/folder information
    $file = New-Object PSObject
    $file | Add-Member -MemberType NoteProperty -Name "Name" -Value $item.Name
    $file | Add-Member -MemberType NoteProperty -Name "Path" -Value $item.FullName
    $file | Add-Member -MemberType NoteProperty -Name "CreationTime" -Value $item.CreationTime
    $file | Add-Member -MemberType NoteProperty -Name "LastAccessTime" -Value $item.LastAccessTime
    $file | Add-Member -MemberType NoteProperty -Name "LastWriteTime" -Value $item.LastWriteTime
    $file | Add-Member -MemberType NoteProperty -Name "Attributes" -Value $item.Attributes
    # add the object to the array
    $files += $file
}

# export the array to an Excel file
$files | Export-Csv -Path "C:\Users\username\Desktop\files.csv" -NoTypeInformation

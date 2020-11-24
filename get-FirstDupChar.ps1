function Get-FirstDupChar{
    param(
        [string]$foo
    )
    if(!$foo){
        return $null
    }
    $ascIIBits = [int[]]::new(128)
    foreach($char in $foo.ToCharArray()){
        $asc2Code = [byte]$char
        if(!$ascIIBits[$asc2Code]){
            $ascIIBits[$asc2Code] = $char
        } else {
            return $char
        }
    }
}

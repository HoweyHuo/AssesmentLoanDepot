. $PSScriptRoot\get-FirstDupChar.ps1

Describe "Happy Path"{
    It "should return a"{
        $foo = "abcda"
        $result = Get-FirstDupChar -foo $foo
        $result | Should Be "a"
    }
}

Describe "no duplicate"{
    It "should return null" {
        $foo = "abc"
        $result = Get-FirstDupChar -foo $foo
        !$result | Should Be $true
    }
}

Describe "pass in Null" {
    It "should be null" {
        $foo = $null
        $result = Get-FirstDupChar -foo $foo
        !$result | Should Be $true
    }
}

Describe "challenge from interview" {
    It "should return d" {
        $result = Get-FirstDupChar -foo abcdedcba
        $result | Should Be "d"
    }
}

Describe "dup after all ascii char" {
    It "should return c" {
        $str = ""
        for($ascCode=0; $ascCode -lt 128; $ascCode++){
            $str += [Char]$ascCode
            $str += "c"
        }
        $result = Get-FirstDupChar -foo $str
        $result | Should Be "c"
    }
}
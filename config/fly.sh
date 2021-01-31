set USER someuser
set PASSWD xxxxxx
set TYPE [lindex $argv 0]
spawn ssh $USER@jumper.com
expect {
        -re "@jumper.com's password:" {
                send "$PASSWD\r"
                send_user "\n\n\n"
                exp_continue
        }
 
        -re "-sometermial" {
                #以work登录个人开发机
                if { $TYPE == "kf" } {
                        send "ssh root@111.111.111.111\r"
                        expect {
                                -re "password:" {
                                        send "xxxxxxx\r"
                                }
                        }
                }

 
                #以我的用户名登录个人开发机
                if { $TYPE == "y" } {
                        send "ssh root@111.111.111.111\r"
                        expect {
                            -re "password:" {
                                    send "xxxxxxxxxxxx\r"        
                            }
                        }
                }

                #以work登录个人开发机
                if { $TYPE == "sz" } {
                        send "ssh root@111.111.111.111\r"
                        expect {
                                -re "password:" {
                                        send "xxxxxxx\r"
                                }
                        }
                }

                #以work登录个人开发机
                if { $TYPE == "szwork" } {
                        send "ssh work@111.111.111.111\r"
                        expect {
                                -re "password:" {
                                        send "xxxxxx\r"
                                }
                        }
                }

                if {$TYPE == "work"} {
                        send "ssh work@111.111.111.111\r"
                        expect {
                        -re "password:" {
                                send "xxxxxxxx\r"
                        }
                        }
                }
 
                #我的调研环境
                if { $TYPE == "dy" } {
                        send "ssh \r"
                        send "cd /home/work/\r"
                }
                
                if {$TYPE == "showx"} {
                        send "ssh work@111.111.111.111\r"
                        send "cd  /home/work/\r"
                }
        }
}
interact
exit


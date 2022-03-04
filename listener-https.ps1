
$IP = hostname -I | awk '{print $1}'
$LocalIP = $IP 
$Puerto =  "30888"
$URLListener = "http://" + $LocalIP + ":" + $Puerto + "/"

# Crea un  listener en el pueto 8000
$listener = New-Object System.Net.HttpListener
$listener.Prefixes.Add($URLListener) 
#$listener.AuthenticationSchemes = AuthenticationSchemes.Basic;
$listener.Start()

Write-host -Foreground Yello "====================================="
Write-host -Foreground Yello "LISTENER $URLListener               "
Write-host -Foreground Yello "====================================="


            # Ejecuta el bucle, es decir, el listener hasta recibir un  /end
            while ($true) {
                $context = $listener.GetContext() 
            
                # Esta es la petición que recibe el servidor
                Write-host -ForegroundColor yello "PETICION"
                $request = $context.Request
                $request 
            
                # Esto es lo que devuelve el servidor una vez se le hecho una petición web
                Write-host -ForegroundColor yello "RESPUESTA"
                $response = $context.Response
                $response
            
                # Break from loop if GET request sent to /end
                if ($request.Url -match '/end$') { 

                    break 

                } else {

#######################################################################################################
#######################################################################################################
#######################################################################################################
                    
                    # Split request URL to get command and options
                    $requestvars = ([String]$request.Url).split("/");      

#######################################################################################################
#######################################################################################################
#######################################################################################################
                    
                    
                    

#############################################################################
#      _  ___
# | | |_)  |  
# |_| | \ _|_ 
#            

# If a request is sent to http:// :8000/vpn
                    
                if ($requestvars[3] -eq "send") {
                    
                        # Se le pasa como posiciÃ³n siguiente el nÃºmero de organizcion
                        # http://10.4.0.44:8888/vpn/XXXXXXX

                       $info= $requestvars[4]

                            if($info -eq $Null){$info = "No has enviado nada"}
                                
                                Write-host -ForegroundColor Yellow $info                                

                                $ArrayArgumentos = %{
                                        " -file /vol-powercli-repository/gitHub-script/departamento/iruiz/listeners/hola-mundo.ps1 "
                                    $info        
                                }
                                
                                # ########################
                                # bloque de ejecucion
                                # ########################

                                # $result = Start-Process pwsh $ArrayArgumentos
                                [string]$message= [System.Net.Dns]::GetHostName()
                                $IPContendor = hostname -I | awk '{print $1}'

                                $message = [string]$message +  " " + $IPContendor
                               
                                

                                                
                                    # Convert the returned data to JSON and set the HTTP content type to JSON
                                    #$message = $result | ConvertTo-Json; 
                                    #$response.ContentType = 'application/json';
                                    
                                $response.ContentType = 'text/html';


                                    }elseif($requestvars[3] -eq "XXX"){

                                        HACE OTRA COSA

                                        
                                    }elseif($requestvars[3] -eq "XXX"){

                                        HACE OTRA COSA


                                    }elseif($requestvars[3] -eq "XXX"){

                                        HACE OTRA COSA

                                            } else { 
                                        
                                                    # If no matching subdirectory/route is found generate a 404 message
                                                    $message = "Esta no es la URL que estas buscando"
                                                    $response.ContentType = 'text/html' ;


                            } #   if ($requestvars[3] -eq "send")
                        
                    
                    # =================================
                    # Convert the data to UTF8 bytes
                    # =================================

                    [byte[]]$buffer = [System.Text.Encoding]::UTF8.GetBytes($message)
                            
                    # Set length of response
                    $response.ContentLength64 = $buffer.length
                            
                    # Write response out and close
                    $output = $response.OutputStream
                    $output.Write($buffer, 0, $buffer.length)
                    $output.Close()
                
                }  #  if ($requestvars[3] -eq "send") {  
            
            } # while ($true) 
            
            #Terminate the listener
            $listener.Stop()


    

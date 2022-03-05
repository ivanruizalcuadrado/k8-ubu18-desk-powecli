
$IP = hostname -I | awk '{print $1}'
$LocalIP = $IP 
$Puerto =  "80"
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
                    
                    $IP = hostname -I | awk '{print $1}'
                    $message = "Recibido:" + $IP

                    
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


    

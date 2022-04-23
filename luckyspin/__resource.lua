resource_manifest_version "44febabe-d386-4d18-afbe-5e627f4af937"

client_script "nui.lua"

server_script {
    '@oxmysql/lib/MySQL.lua',    
    'server.lua'
  
    
}

ui_page "html/demo.html"
files {
   
    'html/demo.html',
    'html/src/rouletteWheel.js',
    'html/img/pointer.png',
    'html/jquery-ui.min.js',
    'html/style.css'

  
}

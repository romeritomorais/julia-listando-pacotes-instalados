if Sys.iswindows() == "true"
    path_windows = joinpath(homedir(), ".julia\\environments\\v1.3")
    cd(path_windows)
else 
    path_linux = joinpath(homedir(), ".julia/environments/v1.3")
    cd(path_linux)
end

pacotes_instalados = [split(i," ")[1] for i in readlines("Project.toml")]
path = "Dropbox/conect/Julia/Packages/";

using Dates
path_file = joinpath(homedir(), path,"Packages.txt")

open(path_file, "w") do t
    for i in readlines("Project.toml")
        x = split(i,"=")[1]
        insert = x
        write(t, Dates.format(DateTime(Dates.now()), "yyyy-mm-dd HH:MM:SS - ") * insert,"\n")
        end;
    end;

println("lista com " *string(length(readlines("Project.toml"))-1) * " pacotes Instalados no " 
        * string(Sys.KERNEL)*"_"*string(Sys.ARCH))
println(repeat("-----------", 4))

for i in readlines(path_file)
    println(i)
end;



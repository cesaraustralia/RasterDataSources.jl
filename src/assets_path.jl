function _raster_assets_folder()
    project_path = dirname(something(Base.current_project(pwd()), Base.load_path_expand(LOAD_PATH[2])))
    assets_folder = joinpath(project_path, "assets", "general")
    ispath(assets_folder) || mkpath(assets_folder)
    return assets_folder
end

function _raster_assets_folder(::Type{TS}, ::Type{TD}) where {TS <: SDMDataSource, TD <: SDMDataSet}
    project_path = dirname(something(Base.current_project(pwd()), Base.load_path_expand(LOAD_PATH[2])))
    assets_folder = joinpath(project_path, "assets", string(TS), string(TD))
    ispath(assets_folder) || mkpath(assets_folder)
    return assets_folder
end

function cleanup_assets()
    ispath(_raster_assets_folder()) && rm(_raster_assets_folder(); recursive=false)
end

function cleanup_assets(::Type{TS}, ::Type{TD}) where {TS <: SDMDataSource, TD <: SDMDataSet}
    ispath(_raster_assets_folder(TS, TD)) && rm(_raster_assets_folder(TS, TD); recursive=false)
end


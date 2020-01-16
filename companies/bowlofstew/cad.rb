# https://www.freecadweb.org/
# https://github.com/FreeCAD/homebrew-freecad
dep 'freecad.cask'
dep("elsi.appstore") {id "id1406239881"}

# https://formulae.brew.sh/cask/sweet-home3d
dep 'sweet-home3d.cask'

dep 'cad' do
    requires [
        'sweet-home3d.cask',
    ]
end

var opts = {
  container: 'new_epiceditor',
  textarea: 'new_editor',
  basePath: 'epiceditor',
  clientSideStorage: true,
  localStorageName: 'new_epiceditor',
  useNativeFullscreen: true,
  parser: marked,
  file: {
    name: 'epiceditor',
    defaultContent: '',
    autoSave: 100
  },
  theme: {
    base: '../../../../../../themes/base/epiceditor.css',
    preview: '../../../../../../themes/preview/github.css',
    editor: '../../../../../../themes/editor/epic-light.css'
  },
  button: {
    preview: true,
    fullscreen: true,
    bar: "auto"
  },
  focusOnLoad: false,
  shortcut: {
    modifier: 18,
    fullscreen: 70,
    preview: 80
  },
  string: {
    togglePreview: 'Toggle Preview Mode',
    toggleEdit: 'Toggle Edit Mode',
    toggleFullscreen: 'Enter Fullscreen'
  },
  autogrow: true
}
var editor = new EpicEditor(opts);
editor.load();

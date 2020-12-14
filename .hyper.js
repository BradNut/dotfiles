// Future versions of Hyper may add additional config options,
// which will not automatically be merged into this file.
// See https://hyper.is#cfg for all currently supported options.

module.exports = {
  config: {
    // choose either `'stable'` for receiving highly polished,
    // or `'canary'` for less polished but more frequent updates
    updateChannel: 'stable',
    
    // default font size in pixels for all tabs
    fontSize: 12,
    
    windowSize: [1080, 720],

    // font family with optional fallbacks
    fontFamily: '"Operator Mono", "Inconsolata for Powerline", monospace',
    
    // `'BEAM'` for |, `'UNDERLINE'` for _, `'BLOCK'` for █
    cursorShape: 'BLOCK',

    // set to `true` (without backticks and without quotes) for blinking cursor
    cursorBlink: true,

    // custom padding (CSS format, i.e.: `top right bottom left`)
    padding: '10px',
    
    shell: '/bin/zsh',

    // if `true` (without backticks and without quotes), selected text will automatically be copied to the clipboard
    copyOnSelect: true,

    // Whether to use the WebGL renderer. Set it to false to use canvas-based
    // rendering (slower, but supports transparent backgrounds)
    webGLRenderer: true,

    // for advanced config flags please refer to https://hyper.is/#cfg
    // omit or set true to show. set false to remove it
    wickedBorder: false,

    // change the colour here
    wickedBorderColor: '#ffc600',
    
    hyperTabs: {
        tabIconsColored: true,
    },
    
    hypercwd: {
      initialWorkingDirectory: '~/projects'
    },
    
    hyperTabs: {
      // The height(unit px) of zone over tabs to drag the window
      navMoveable: 0,
      // The hotkeys of move tabs
      hotkeys: {
        moveLeft: 'command+[',
        moveRight: ['command+]', 'r i g h t']
      }
    },
    
  },

  // a list of plugins to fetch and install from npm
  // format: [@org/]project[#version]
  // examples:
  //   `hyperpower`
  //   `@company/project`
  //   `project#1.0.1`
  plugins: [
    'hyperterm-cobalt2-theme',
    'hyper-statusline',
    'hyper-tabs-enhanced',
    'hyper-reorderable-tabs',
    'hypercwd',
  ],

  // in development, you can create a directory under
  // `~/.hyper_plugins/local/` and include it here
  // to load it and avoid it being `npm install`ed
  localPlugins: [],

  keymaps: {
    // Example
    // 'window:devtools': 'cmd+alt+o',
  },
};

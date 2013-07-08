(setq el-get-sources
      (append el-get-sources '((:name android-mode
                                      :after (progn
                                               (require 'android-mode)
                                               (custom-set-variables
                                                '(android-mode-avd "test")
                                                '(android-mode-sdk-dir "~/nethd/local_soft/android-sdk-linux"))
                                               ))
                               )))

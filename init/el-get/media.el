(setq el-get-sources
      (append el-get-sources '((:name emms
                                      :type git
                                      :url "https://github.com/emacsmirror/emms/"
                                      :load-path ("." "./lisp")
                                      :features emms-setup
                                      :after (progn
                                               (emms-devel)
                                               (setq emms-source-file-default-directory "~/Music/")
                                               ;; Track Show Format (for playlist buffer)
                                               (setq emms-last-played-format-alist
                                                     '(((emms-last-played-seconds-today) . "%a %H:%M")
                                                       (604800                           . "%a %H:%M") ; this week
                                                       ((emms-last-played-seconds-month) . "%d")
                                                       ((emms-last-played-seconds-year)  . "%m/%d")
                                                       (t                                . "%Y/%m/%d")))
                                               (emms-history-load) ;; generate playlist buffer

                                               (eval-after-load "emms"
                                                 '(progn
                                                    ;; playlist
                                                    (setq my-emms-playlist (concat emms-source-file-default-directory "playlist"))

                                                    ;; lyrics and playing-time
                                                    (setq emms-lyrics-dir (concat emms-source-file-default-directory "lyrics")
                                                          emms-mode-line-format "[ %s ]"
                                                          emms-lyrics-display-format "%s"
                                                          emms-playing-time-display-format "%s")

                                                    (defun ywb-save-playlist-m3ulist ()
                                                      "Save playlist buffer to m3u file"
                                                      (interactive)
                                                      (save-excursion
                                                        (set-buffer emms-playlist-buffer)
                                                        (call-interactively 'ido-write-file)))

                                                    ;; Save current playlist to file before exit
                                                    (add-hook 'kill-emacs-hook (lambda()
                                                                                 (set-buffer emms-playlist-buffer)
                                                                                 (write-region (point-min) (point-max) my-emms-playlist nil)))

                                                    (setq xwl-emms-playlist-last-track nil)
                                                    (setq xwl-emms-playlist-last-indent "\\")

                                                    (defun xwl-emms-track-description-function (track)
                                                      "Return a description of the current track."
                                                      (let* ((name (emms-track-name track))
                                                             (type (emms-track-type track))
                                                             (short-name (file-name-nondirectory name))
                                                             (play-count (or (emms-track-get track 'play-count) 0))
                                                             (last-played (or (emms-track-get track 'last-played) '(0 0 0)))
                                                             (empty "..."))
                                                        (prog1
                                                            (case (emms-track-type track)
                                                              ((file url)
                                                               (let* ((artist (or (emms-track-get track 'info-artist) empty))
                                                                      (year (emms-track-get track 'info-year))
                                                                      (playing-time (or (emms-track-get track 'info-playing-time) 0))
                                                                      (min (/ playing-time 60))
                                                                      (sec (% playing-time 60))
                                                                      (album (or (emms-track-get track 'info-album) empty))
                                                                      (tracknumber (emms-track-get track 'info-tracknumber))
                                                                      (short-name (file-name-sans-extension
                                                                                   (file-name-nondirectory name)))
                                                                      (title (or (emms-track-get track 'info-title) short-name))

                                                                      ;; last track
                                                                      (ltrack xwl-emms-playlist-last-track)
                                                                      (lartist (or (and ltrack (emms-track-get ltrack 'info-artist))
                                                                                   empty))
                                                                      (lalbum (or (and ltrack (emms-track-get ltrack 'info-album))
                                                                                  empty))

                                                                      (same-album-p (and (not (string= lalbum empty))
                                                                                         (string= album lalbum))))
                                                                 (format "%10s  %3d   %-20s%-60s%-35s%-15s%s"
                                                                         (emms-last-played-format-date last-played)
                                                                         play-count
                                                                         artist

                                                                         ;; Combine indention, tracknumber, title.
                                                                         (concat
                                                                          (if same-album-p ; indention by album
                                                                              (setq xwl-emms-playlist-last-indent
                                                                                    (concat " " xwl-emms-playlist-last-indent))
                                                                            (setq xwl-emms-playlist-last-indent "\\")
                                                                            "")
                                                                          (if (and tracknumber ; tracknumber
                                                                                   (not (zerop (string-to-number tracknumber))))
                                                                              (format "%02d." (string-to-number tracknumber))
                                                                            "")
                                                                          title        ; title
                                                                          )

                                                                         ;; album
                                                                         (cond ((string= album empty) empty)
                                                                               ;; (same-album-p "  ")
                                                                               (t (concat "《" album "》")))

                                                                         (or year empty)
                                                                         (if (or (> min 0)  (> sec 0))
                                                                             (format "%02d:%02d" min sec)
                                                                           empty))))
                                                              ((url)
                                                               (concat (symbol-name type) ":" name))
                                                              (t
                                                               (format "%-3d%s"
                                                                       play-count
                                                                       (concat (symbol-name type) ":" name))))
                                                          (setq xwl-emms-playlist-last-track track))))

                                                    (setq emms-track-description-function
                                                          'xwl-emms-track-description-function)
                                                    ))

                                               ))
                               )))

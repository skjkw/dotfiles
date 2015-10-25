;; IMAP, gmail:
(setq elmo-imap4-default-server "imap.gmail.com"
      elmo-imap4-default-user "shun.kajikawa@gmail.com"
      elmo-imap4-default-authenticate-type 'clear
      elmo-imap4-default-port '993
      elmo-imap4-default-stream-type 'ssl

      ;;for non ascii-characters in folder-names
      elmo-imap4-use-modified-utf7 t)

;; SMTP
(setq wl-smtp-connection-type 'starttls
      wl-smtp-posting-port 587
      wl-smtp-authenticate-type "plain"
      wl-smtp-posting-user "shun.kajikawa@gmail.com"
      wl-smtp-posting-server "smtp.gmail.com"
      wl-local-domain "gmail.com"
      wl-message-id-domain "smtp.gmail.com")

(setq wl-from "s.kajikawa <shun.kajikawa@gmail.com>")
(setq
      ;;all system folders (draft, trash, spam, etc) are placed in the
      ;;[Gmail]-folder, except inbox. "%" means it's an IMAP-folder
      wl-default-folder "%inbox"
      wl-draft-folder   "%[Gmail]/Drafts"
      wl-trash-folder   "%[Gmail]/Trash"
      wl-fcc            "%[Gmail]/Sent"

      ;; mark sent messages as read (sent messages get sent back to you and
      ;; placed in the folder specified by wl-fcc)
      wl-fcc-force-as-read    t

      ;;for when auto-compleating foldernames
      wl-default-spec "%")

;; 画面を普通のメーラみたいな 3ペインに
(setq wl-stay-folder-window t)
;; サマリモードで日時を英語表示
;; (setq wl-summary-weekday-name-lang 'en)
;; HTMLファイルは表示しない。
;;(setq mime-setup-enable-inline-html nil)
;; メールを書くときは見出し画面を残して、フル画面にする
(setq wl-draft-reply-buffer-style 'keep)
;; 送信済みIMAPフォルダは送信と同時に既読にする
(setq wl-fcc-force-as-read t)
;; 最初からスレッドを開いておかない
;;(setq wl-thread-insert-opened nil)
;; スレッドを分割するしきい値(デフォルト：30)
(setq wl-summary-max-thread-depth 30)
;; 警告無しに開けるメールサイズの最大値(デフォルト：30K)
(setq elmo-message-fetch-threshold 500000)
;; プリフェッチ時に確認を求めるメールサイズの最大値(デフォルト：30K)
(setq wl-prefetch-threshold 500000)

;;;------------------------------------------
(setq wl-dispose-folder-alist
      (cons '("^%inbox" . remove) wl-dispose-folder-alist))


;;;------------------------------------------
;;; from,to のデコード指定。
(mime-set-field-decoder
 'From nil 'eword-decode-and-unfold-unstructured-field-body)
(mime-set-field-decoder
 'To nil 'eword-decode-and-unfold-unstructured-field-body)

;;;------------------------------------------
;; summary-mode ですべての header を一旦除去
(setq mime-view-ignored-field-list '("^.*"))

;; 表示するヘッダ。
(setq wl-message-visible-field-list
      (append mime-view-visible-field-list
        '("^Subject:" "^From:" "^To:" "^Cc:"
          "^X-Mailer:" "^X-Newsreader:" "^User-Agent:"
          "^X-Face:" "^X-Mail-Count:" "^X-ML-COUNT:"
          )))

;; 隠すメールヘッダを指定。
(setq wl-message-ignored-field-list
      (append mime-view-ignored-field-list
      '(".*Received:" ".*Path:" ".*Id:" "^References:"
        "^Replied:" "^Errors-To:"
        "^Lines:" "^Sender:" ".*Host:" "^Xref:"
        "^Content-Type:" "^Content-Transfer-Encoding:"
        "^Precedence:"
        "^Status:" "^X-VM-.*:"
        "^X-Info:" "^X-PGP" "^X-Face-Version:"
        "^X-UIDL:" "^X-Dispatcher:"
        "^MIME-Version:" "^X-ML" "^Message-I.:"
        "^Delivered-To:" "^Mailing-List:"
        "^ML-Name:" "^Reply-To:" "Date:"
        "^X-Loop" "^X-List-Help:"
        "^X-Trace:" "^X-Complaints-To:"
        "^Received-SPF:" "^Message-ID:"
        "^MIME-Version:" "^Content-Transfer-Encoding:"
        "^Authentication-Results:"
        "^X-Priority:" "^X-MSMail-Priority:"
        "^X-Mailer:" "^X-MimeOLE:"
        )))


;;;---------------------------------------------------
;; ファイル名が日本語の添付ファイルをデコードする [semi-gnus-ja: 4332]
(eval-after-load "mime"
'(defadvice mime-entity-filename
(after eword-decode-for-broken-MUA activate)
"Decode eworded file name for *BROKEN* MUA."
(when (stringp ad-return-value)
(setq ad-return-value (eword-decode-string ad-return-value t)))))

;; ファイル名が日本語の添付ファイルをエンコードする [semi-gnus-ja: 6046]
(eval-after-load "std11"
  '(defadvice std11-wrap-as-quoted-string (before encode-string activate)
     "Encode a string."
     (require 'eword-encode)
     (ad-set-arg 0 (or (eword-encode-string (ad-get-arg 0)) "" )) ))


;; 添付ファイルがある場合は「@」を表示
(setq elmo-msgdb-extra-fields
(cons "content-type" elmo-msgdb-extra-fields))
(setq wl-summary-line-format-spec-alist
(append wl-summary-line-format-spec-alist
'((?@ (wl-summary-line-attached)))))
(setq wl-summary-line-format "%n%T%P%1@%M/%D(%W)%h:%m %t%[%17(%c %f%) %] %s")

;;ルート証明書の確認を行わない
(setq ssl-program-arguments '("s_client" "-quiet" "-host" host "-port" service))
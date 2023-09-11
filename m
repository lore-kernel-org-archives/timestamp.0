Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 501873D8C
	for <timestamp@lists.linux.dev>; Mon, 11 Sep 2023 09:46:10 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-400a087b0bfso44906225e9.2
        for <timestamp@lists.linux.dev>; Mon, 11 Sep 2023 02:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1694425568; x=1695030368; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=w9ahDhPc6L0ywEvUgRNWzT5d0G2oBcSOo4fjp5iRg6c=;
        b=fIrpOHvkRr2cNlOpIPlfd4lvKwX7UvkZkpLk2Fzqy+NXCWWOGNEGEnnMNy4SovBgR+
         nX+6gF06d7qXhxKPILQoRPOMbsVCE0wQ7F1PEme1Mqv8qA4b85Gqg9pRKwt7RrtO8xtt
         ubRpgEpo/bJuLgHouj8unsIG36xhcDCjLcdWI8sYZDu2K25BpWF6bMKZd9Qm7NOc/MuY
         cRGgWVvr1Dqnfd8DkeVa1V6ZWwUrbiwnacztjhOyO9M7xKuUiMmfko3xkcEDay24NCnI
         TRCQ+3LzJm94kwFUDfVR1NZ8CBrZl4DbrqtQTTxEO3d/Mw5Cr28LwCaUsHEs8JbXxxCU
         u69g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694425568; x=1695030368;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w9ahDhPc6L0ywEvUgRNWzT5d0G2oBcSOo4fjp5iRg6c=;
        b=gI1088jz5xCAULxfvnwo4YaJqm3k0xJeBlD5yvlfHr4ao6hkKdsIojRXW61/kW5NxX
         uR2m93yqCCRgdKcu8eyOANnd5NKgxSU0L6nceXO5BGB/V5i5D2Hx91CnRSFYcZQPWXPJ
         sF/WjZ9iAnCcpofSno16bxyl3e531hwnsghACTCLTVE5AbbYXc5fR+jJDKE2srSyio4I
         O1jsbbAvd+DmmUzegYwlJmV+WwfXQ/jvkZWsliWEP8iU7qySzweARif3I11OsWouK+Po
         XeNenRnw6g6jKdXrUmcU8MZ3Vtvdcc89DKgaGEAnseE7TtZ+MbFV8QclSQ5HwIFfqOKs
         RQAg==
X-Gm-Message-State: AOJu0YycEBnaIajOMhUaZi9yW8b3JM1VNqVZO9M2vb3UTtS9Zwu8onWT
	8QL3KclhcUOlPOgZlCrx7+BccO/0djeK6gPCMg0=
X-Google-Smtp-Source: AGHT+IFGUMpGnpUE1hRHPjyhgmIROsEkgEC38A2hYNyCGyp7CKvL1rV4WL2PF+ArTt1b2DV7vW7sWw==
X-Received: by 2002:a7b:ce06:0:b0:401:4417:a82d with SMTP id m6-20020a7bce06000000b004014417a82dmr7816601wmc.38.1694425568379;
        Mon, 11 Sep 2023 02:46:08 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:c2b1:675e:119e:2497])
        by smtp.gmail.com with ESMTPSA id u3-20020a05600c210300b003fe601a7d46sm12680275wml.45.2023.09.11.02.46.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Sep 2023 02:46:08 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Dipen Patel <dipenp@nvidia.com>
Cc: timestamp@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] hte: allow building modules with COMPILE_TEST enabled
Date: Mon, 11 Sep 2023 11:46:04 +0200
Message-Id: <20230911094604.14179-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: timestamp@lists.linux.dev
List-Id: <timestamp.lists.linux.dev>
List-Subscribe: <mailto:timestamp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:timestamp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Allow building all HTE modules with COMPILE_TEST Kconfig option enabled.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
---
This was part of a wider series but since this is independent, I'm sending
it separately.

 drivers/hte/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hte/Kconfig b/drivers/hte/Kconfig
index cf29e0218bae..083e67492bf2 100644
--- a/drivers/hte/Kconfig
+++ b/drivers/hte/Kconfig
@@ -16,7 +16,7 @@ if HTE
 
 config HTE_TEGRA194
 	tristate "NVIDIA Tegra194 HTE Support"
-	depends on ARCH_TEGRA_194_SOC
+	depends on (ARCH_TEGRA_194_SOC || COMPILE_TEST)
 	help
 	  Enable this option for integrated hardware timestamping engine also
 	  known as generic timestamping engine (GTE) support on NVIDIA Tegra194
@@ -25,7 +25,7 @@ config HTE_TEGRA194
 
 config HTE_TEGRA194_TEST
         tristate "NVIDIA Tegra194 HTE Test"
-        depends on HTE_TEGRA194
+        depends on (HTE_TEGRA194 || COMPILE_TEST)
         help
 	  The NVIDIA Tegra194 GTE test driver demonstrates how to use HTE
 	  framework to timestamp GPIO and LIC IRQ lines.
-- 
2.39.2


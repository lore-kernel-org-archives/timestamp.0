Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B987DDD1
	for <timestamp@lists.linux.dev>; Tue,  5 Sep 2023 18:53:42 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4018af103bcso1013485e9.1
        for <timestamp@lists.linux.dev>; Tue, 05 Sep 2023 11:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1693940020; x=1694544820; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c6tn4Tgcsi1O0hqP3FN/fJ4KrpHQM0EtczTKadJgTtw=;
        b=bi/PuediI+N9Dc48ia1eajiBHjeW+OTQAwBXo5YtEE302akYJmCELYda5o/9b4+cgP
         lPFO51at/czm+Zv3Wl9LXQhz33OUwYQ5CpKgI+xq+vMih3vORpbcXgHzj7P7B320d9mY
         38dFb2frHripChzQnb987YhNWjETEmKFe7O9ON9vnS3uMehAN1WDKdoP+aio3b3GRmbP
         HlLqIvgYPxcuvG5DeSu2VHF+4Q9Mcznmtt9CseoaEw5+ek3p0vlEgVzcA7J+2xjrV91o
         59HY+n3NplZbYPxzFjugtlk/xgjCglxHq/8H4/TwhxUBfVLOR+SP5y3jtSgd4BPc2MgV
         wL4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693940020; x=1694544820;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c6tn4Tgcsi1O0hqP3FN/fJ4KrpHQM0EtczTKadJgTtw=;
        b=GZq1uPYPyKAK53QDyePMJ0WP8MSrPS4xb75UsjnG4IYwS0mg4lVJ8f+yojS2n5axYU
         ODAYXOgkrp2HmrJLk9ozHi8cpXH3VHOOd4aHbJCgMkRKI+PGs2nPBbSCpw2oZUjSaxGW
         fmxovFgFQ+XoJk4kG3bqEDQEA68uHLVQDs/DhZDL+A7ylxOYgPTujsGzBCBAzTuMGaQD
         HwwqBEPqV+VZBbzQelruNtEgcLKUGQ1colTAe612yJF62oMKMyCpxijQ35Yq4vNPZ65k
         MD+zVdYPN9gbnDPKwt3Swoa9nJphLz/1WDr5R3e+P6KnCLo372fFnxBUi+C2gYd9ZOKk
         r+1g==
X-Gm-Message-State: AOJu0YwZ6y05CbJNnXgcWzdYxX/beHqvSwETzKlq276znwLr+EsjO69m
	xPikJJ6JPzfPrwUePXr8pFJr2g==
X-Google-Smtp-Source: AGHT+IHaOumSDU3nr/8PNaqRqHS3aAWO3c0eVyPkb5h63GCpGBG6kfLxrczPHvapwSdIRLtHe1YhsQ==
X-Received: by 2002:a7b:ce90:0:b0:3fe:1b5e:82 with SMTP id q16-20020a7bce90000000b003fe1b5e0082mr547652wmj.20.1693940020693;
        Tue, 05 Sep 2023 11:53:40 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:7a54:5dbc:6d09:48b7])
        by smtp.gmail.com with ESMTPSA id 17-20020a05600c249100b003fbc30825fbsm17550010wms.39.2023.09.05.11.53.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Sep 2023 11:53:40 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Aaro Koskinen <aaro.koskinen@iki.fi>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	Tony Lindgren <tony@atomide.com>,
	Russell King <linux@armlinux.org.uk>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Dipen Patel <dipenp@nvidia.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Mark Gross <markgross@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	timestamp@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 12/21] hte: allow building modules with COMPILE_TEST enabled
Date: Tue,  5 Sep 2023 20:53:00 +0200
Message-Id: <20230905185309.131295-13-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230905185309.131295-1-brgl@bgdev.pl>
References: <20230905185309.131295-1-brgl@bgdev.pl>
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
---
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


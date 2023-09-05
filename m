Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E88EDDD1
	for <timestamp@lists.linux.dev>; Tue,  5 Sep 2023 18:53:47 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-401bdff4cb4so28607195e9.3
        for <timestamp@lists.linux.dev>; Tue, 05 Sep 2023 11:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1693940025; x=1694544825; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ENyvcqOYq6piL9aYNsmVNToV9MKgtDTkh/A8a81eQKQ=;
        b=2Qjxd5NLRMwkp68k1wHopJHV8m1PmK3fdr42fNnRnZcB7aNaLRaT8ahX5WCj31cEdm
         zvEdaE6d0sxwsFAKQT3ETI0mdj1doVuaOxBJYS24M+373f/hmWtzu8S+KyCcKwsLl/p8
         D7MVBQ0UQom7InHrbT26CYuutG1ZJwIJXIuqRBGFh6W/Fz/DsxEEPVxSDFx2C/ORBXqL
         eS6bNfHeEbl+lOohHP/RYiTULbcdAV+P8S/5EEXiaowRO8KPvdfvqVOFlyNhCmTNh+qB
         oe97ZveZiSpRzqg/kU8xvyWM/IKNabK/lhgfFxm8W5vCy32/QzDm42xLGJfjWwhgKLlh
         4Gdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693940025; x=1694544825;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ENyvcqOYq6piL9aYNsmVNToV9MKgtDTkh/A8a81eQKQ=;
        b=alGFTbw7uKZDFHshs0JaBHOQOJRyaW8Uns6oNaFEcZ/+LsjFHRhnjg4GMCSp5/zL0I
         7IaJMw9zduOkcNxGkN46R3fV79SoPCw3Wphm7G49KzB3VJMX5pyR2iWHqzkYlcM5xiQq
         OM+x2mIWtGGzzB3VmUJiyYaFiSbxk6eMY1bOKS2aKV0yYBWGr05Nd/xCgt+f+LgkpIQI
         EsLsYCObZE0vC3WRwevMCt0Pj7nT8LyKkr06ifrbVOLn9ZNyFh9ljY7X2rOe9YaaqohD
         1TLS1k01q+qQNgGh1xf0MzTeWPzZ31TXXlBi1voxulwQqWhFuzgLjflnZrc4ZzXRDLS7
         gimA==
X-Gm-Message-State: AOJu0YzdsDZ1B5jJhujTyQaYSxf1lBsDWZitzjPpdadJ6RMa3Lu1bCfT
	Ks+yLQt6MDBMxL7/hM1DJfz/Ag==
X-Google-Smtp-Source: AGHT+IETzIspKoYp23peY3Mtm+8LIAaFcti4lea83HydZgiIlGoA8ysWTU5DS/F06PC8tJEHYtDSiA==
X-Received: by 2002:a1c:7410:0:b0:401:d1a3:d7f7 with SMTP id p16-20020a1c7410000000b00401d1a3d7f7mr407237wmc.30.1693940025441;
        Tue, 05 Sep 2023 11:53:45 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:7a54:5dbc:6d09:48b7])
        by smtp.gmail.com with ESMTPSA id 17-20020a05600c249100b003fbc30825fbsm17550010wms.39.2023.09.05.11.53.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Sep 2023 11:53:45 -0700 (PDT)
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
Subject: [PATCH 16/21] gpio: of: correct notifier return codes
Date: Tue,  5 Sep 2023 20:53:04 +0200
Message-Id: <20230905185309.131295-17-brgl@bgdev.pl>
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

According to the comments in linux/notifier.h, the code to return when a
notifications is "not for us" is NOTIFY_DONE, not NOTIFY_OK.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib-of.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index 531faabead0f..5515f32cf19b 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -834,14 +834,14 @@ static int of_gpio_notify(struct notifier_block *nb, unsigned long action,
 	switch (of_reconfig_get_state_change(action, arg)) {
 	case OF_RECONFIG_CHANGE_ADD:
 		if (!of_property_read_bool(rd->dn, "gpio-hog"))
-			return NOTIFY_OK;	/* not for us */
+			return NOTIFY_DONE;	/* not for us */
 
 		if (of_node_test_and_set_flag(rd->dn, OF_POPULATED))
-			return NOTIFY_OK;
+			return NOTIFY_DONE;
 
 		chip = of_find_gpiochip_by_node(rd->dn->parent);
 		if (chip == NULL)
-			return NOTIFY_OK;	/* not for us */
+			return NOTIFY_DONE;	/* not for us */
 
 		ret = of_gpiochip_add_hog(chip, rd->dn);
 		if (ret < 0) {
@@ -850,22 +850,22 @@ static int of_gpio_notify(struct notifier_block *nb, unsigned long action,
 			of_node_clear_flag(rd->dn, OF_POPULATED);
 			return notifier_from_errno(ret);
 		}
-		break;
+		return NOTIFY_OK;
 
 	case OF_RECONFIG_CHANGE_REMOVE:
 		if (!of_node_check_flag(rd->dn, OF_POPULATED))
-			return NOTIFY_OK;	/* already depopulated */
+			return NOTIFY_DONE;	/* already depopulated */
 
 		chip = of_find_gpiochip_by_node(rd->dn->parent);
 		if (chip == NULL)
-			return NOTIFY_OK;	/* not for us */
+			return NOTIFY_DONE;	/* not for us */
 
 		of_gpiochip_remove_hog(chip, rd->dn);
 		of_node_clear_flag(rd->dn, OF_POPULATED);
-		break;
+		return NOTIFY_OK;
 	}
 
-	return NOTIFY_OK;
+	return NOTIFY_DONE;
 }
 
 struct notifier_block gpio_of_notifier = {
-- 
2.39.2


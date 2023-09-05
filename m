Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46069DDAF
	for <timestamp@lists.linux.dev>; Tue,  5 Sep 2023 18:53:33 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-401b0d97850so30051985e9.2
        for <timestamp@lists.linux.dev>; Tue, 05 Sep 2023 11:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1693940012; x=1694544812; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0ESplXfwHuP68mF4bwcKzJlFkniMRPzx/b85/cMF6oE=;
        b=z3b1zG75pDJ/72Lu3LcAmgG8bjbALe/grr/g6vV+VhTuMAle92lSao0lABiep9BPTD
         kPnXL49JJvGN9gimiNSEjppN/5LQjGDus15eePT/oC9w9vh600/Z0YJjjOivsPFCFZPt
         NJo21Zg7WDB0FnsKn1cX7T+b5Rpf+Sbh4PE4SJ10SISUmQlYRuvA9t9mJ8NIzO7lpt1w
         YI1mMjllWZzvkPVxdAmU8CKqKxPUb/a9V1tdf7pW4ZCwLO06oM9ZF7DcHGjrEcFqlyi5
         MbQrpUAwRkjJlEM6WiuE7fCuXo/yIvW1E9+SZ4rDJ50dUMS55E/vCWouytRYHy1oKSR2
         oWfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693940012; x=1694544812;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0ESplXfwHuP68mF4bwcKzJlFkniMRPzx/b85/cMF6oE=;
        b=U5lOVNN0Wkgi30nRc55j73J6OCAIPUJpkMWZIgDxtT55L/pyAJs6EnVTnnj8ru5xgS
         vYEXXYP93W6/W5jv1N2TKfr5modnx3GtWSDnPOh8CU+ZNj2gVeHxKLUU4uIToQEJwHEL
         E3GF/+1evM00wC4h1aZzOoc6HzrtXnec6adc4KBoDvpJo6txEdv9TuHel4GAlke+85yt
         nuy+oO1NAoUbHxs+xeo2VItWFSUa8lhg9s+y2+e7Y5Fmwxl0vZKjjcIHdfCOV8tYz8WI
         v3rAT+VZS3yEt6sa6SLhEn3e3j7Bp34WR8pV1rF2KEXOFU//nlzhORIJ413CmGwFsKoD
         ObXA==
X-Gm-Message-State: AOJu0YxV+DRsAMzXLcscXvyLLnvw1LtjBGBwLmnCR/dF2nHNR/w383kG
	1LioSrmRPHugj+SCLIYnbGPKwQ==
X-Google-Smtp-Source: AGHT+IH/VUJWjUGeUiwbD9fUfZeGiUcxVuhg9dWO0f7MJ889A/l01WqAkHMkYlgWTOb/EzfuaH05Kg==
X-Received: by 2002:a7b:c411:0:b0:3fe:f45:772d with SMTP id k17-20020a7bc411000000b003fe0f45772dmr436878wmi.28.1693940012315;
        Tue, 05 Sep 2023 11:53:32 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:7a54:5dbc:6d09:48b7])
        by smtp.gmail.com with ESMTPSA id 17-20020a05600c249100b003fbc30825fbsm17550010wms.39.2023.09.05.11.53.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Sep 2023 11:53:31 -0700 (PDT)
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
Subject: [PATCH 05/21] gpiolib: add support for scope-based management to gpio_device
Date: Tue,  5 Sep 2023 20:52:53 +0200
Message-Id: <20230905185309.131295-6-brgl@bgdev.pl>
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

As the few users that need to get the reference to the GPIO device often
release it right after inspecting its properties, let's add support for
the automatic reference release to struct gpio_device.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 include/linux/gpio/driver.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index a769baf3d731..b2572b26c8e3 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -614,6 +614,8 @@ struct gpio_device *gpio_device_find_by_label(const char *label);
 struct gpio_device *gpio_device_get(struct gpio_device *gdev);
 void gpio_device_put(struct gpio_device *gdev);
 
+DEFINE_FREE(gpio_device_put, struct gpio_device *, if (_T) gpio_device_put(_T));
+
 bool gpiochip_line_is_irq(struct gpio_chip *gc, unsigned int offset);
 int gpiochip_reqres_irq(struct gpio_chip *gc, unsigned int offset);
 void gpiochip_relres_irq(struct gpio_chip *gc, unsigned int offset);
-- 
2.39.2


Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4A9C3D8C
	for <timestamp@lists.linux.dev>; Mon, 11 Sep 2023 09:44:52 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-401bbfc05fcso46933445e9.3
        for <timestamp@lists.linux.dev>; Mon, 11 Sep 2023 02:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1694425491; x=1695030291; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=R0/rqbO9zdTuj+XkCrDufr//URbhGp0n8nPQ9514Kz8=;
        b=ylHX4yfeNJWQwUmeT6WQ13FhZIbIxWHmlXJfkcTT1tb9J7OOCnre8Oh7CE8spl+udG
         WRenfgCG1kyITH22MqWtg6dWXN7f8xwUTfj0ZOnq4A800TA5XJl5l4XpfCrY+8m+uxg0
         wr5X7Hi2qM0fwV3IzUz0z//O7Nk1EGX9hE2RqPq3XG8U1/EACnxpULajdrslwm2uVsBE
         05FJtg9Cx7YVlEUkWFLIjoobEf8ewnPRUl7Kay7qUHn/xxNqx7lzDlO4nTIP8miAfojv
         aNRwW1DLfjuB1URcwIJk9Q6sqWtyGJ8kx8dotjAVf7GaeJfrGIwF+/UFIuevkk1autpb
         KJhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694425491; x=1695030291;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R0/rqbO9zdTuj+XkCrDufr//URbhGp0n8nPQ9514Kz8=;
        b=nlQOa2Ct6162BNQflv/XTEZ5PuABuN4lfi44jmBDcUFGpNGxd2bRaIJ4zPRCSl2Cz9
         ufPLq86X1wmbJShgTzv3VxeK6ehcvrKg3l9wUJyvQ4tT7dxrLs+Oasa0BcsKJtY4s6fu
         +3wBSwfsLDHFoWi7zfmhXNgNcK8PQdev4ygr4fkR4NYQq+T2aSBmtIwIVBnNKigSIkDG
         /I5/4A3idmmQ4VXPmL3cWzRauJtiaGNTLiNgZB4DbwOMjVIwNZs3XQMXTHiK5xe4dOHr
         U0BCEh+rOvIG+0+D7tUHAnwvBo7WTfjFkLuErbnwjLDHMY+JgEpx+ji2JdvcivTRIp2a
         QbQA==
X-Gm-Message-State: AOJu0YyXTEaY7LA+i0I1FHnLvWIY7vddODfa3gVDMHjFIBS7i4x4kamX
	wJiEjCvYULAs9NYU/fn/rQDC2A==
X-Google-Smtp-Source: AGHT+IFoi4Dei8OscALHdqZx2NassPsp3aooQcZ1UAgjVrAk+Jw6ryGdd0bnraeWRUOWi1pzfF528Q==
X-Received: by 2002:a1c:7508:0:b0:3fe:d1e9:e6b8 with SMTP id o8-20020a1c7508000000b003fed1e9e6b8mr8066631wmc.12.1694425490282;
        Mon, 11 Sep 2023 02:44:50 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:c2b1:675e:119e:2497])
        by smtp.gmail.com with ESMTPSA id c26-20020a7bc01a000000b003feeb082a9fsm9627985wmb.3.2023.09.11.02.44.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Sep 2023 02:44:49 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Dipen Patel <dipenp@nvidia.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>
Cc: timestamp@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] hte: tegra194: improve the GPIO-related comment
Date: Mon, 11 Sep 2023 11:44:43 +0200
Message-Id: <20230911094443.14040-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: timestamp@lists.linux.dev
List-Id: <timestamp.lists.linux.dev>
List-Subscribe: <mailto:timestamp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:timestamp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Using any of the GPIO interfaces using the global numberspace is
deprecated. Make it clear in the comment.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
---
This was part of a wider series but since this is independent, I'm sending
it separately.

 drivers/hte/hte-tegra194.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/hte/hte-tegra194.c b/drivers/hte/hte-tegra194.c
index 6fe6897047ac..9fd3c00ff695 100644
--- a/drivers/hte/hte-tegra194.c
+++ b/drivers/hte/hte-tegra194.c
@@ -407,12 +407,15 @@ static int tegra_hte_line_xlate(struct hte_chip *gc,
 		return -EINVAL;
 
 	/*
+	 * GPIO consumers can access GPIOs in two ways:
 	 *
-	 * There are two paths GPIO consumers can take as follows:
-	 * 1) The consumer (gpiolib-cdev for example) which uses GPIO global
-	 * number which gets assigned run time.
-	 * 2) The consumer passing GPIO from the DT which is assigned
-	 * statically for example by using TEGRA194_AON_GPIO gpio DT binding.
+	 * 1) Using the global GPIO numberspace.
+	 *
+	 * This is the old, now DEPRECATED method and should not be used in
+	 * new code. TODO: Check if tegra is even concerned by this.
+	 *
+	 * 2) Using GPIO descriptors that can be assigned to consumer devices
+	 * using device-tree, ACPI or lookup tables.
 	 *
 	 * The code below addresses both the consumer use cases and maps into
 	 * HTE/GTE namespace.
-- 
2.39.2


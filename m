Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B47C22741DF
	for <timestamp@lists.linux.dev>; Wed, 26 Nov 2025 10:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764153984; cv=none; b=CjiW3sVuyVzKmKLNRx3pYWN0295RCwtLQ5l0p9uDfz6DdbT17YF4PN4mGnwje2jQaIqiCcp5e6MtbdPDtoDcDNcVmiC3jDqcM+qMMVeoWCemh/U+XGG2Qm5509dGL1ZmCu6FVkdW+bw7Gaypd4A1wFukoH7ZDCX97S/7bM29gxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764153984; c=relaxed/simple;
	bh=diA+OAr/q4QiqrjbEaPa6xxMoHhruPZ95mDGRkWCNGU=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=Ss/xkvQvUS3PFsqFXZdLsn6M1fly2AKn5TdFmTy+WZwa81lT5DQuO4D48tk1kotPaakX2+OkRfl30bL8OZUouHdj2Ejj5cPfz/VHVBKnKY8b+3bk+usRzQI94E+YTqfNZXknl+IT2MllGH4Y1csDclkrV7nhYUz/RaOTFkD3KjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=xtVdnNMC; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="xtVdnNMC"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b727f452fffso122164966b.1
        for <timestamp@lists.linux.dev>; Wed, 26 Nov 2025 02:46:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1764153980; x=1764758780; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=GW4y0UN/HKCR1GtEapEFIit/yLFqp2GxqcKWnblekRM=;
        b=xtVdnNMCxZnIV7aK3+mecXk2NzU0HuvATuxriGZH/7O9u5f5WrVThXJ6F+dEVg2Qgn
         h1vZ/9LPGg3et/ucgdFQbwNOUzJbmGsNLj0yn1lX3hECXFETJ9zzFjTOGiIqJnF1cGi0
         rVLh3wO9AlfcCcQUzOcxlAZMsnB7lTpaPIRb6wQY3scHEt+MCaZB+W+5n3mWYEaujB2Y
         G/xx6Igh8VRL8Mg1aTpNpwpHKToZuCA+mPDwXmI5L+7MbK+oaA2HEPNybYYQM+qC7hhm
         +yw6O5QuFsaX2QhQRE4MAkBKCVQ+S1q+xRYNW5/AeejqoHCVsI/SqFanqFJwvAD9w5oM
         7O0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764153980; x=1764758780;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GW4y0UN/HKCR1GtEapEFIit/yLFqp2GxqcKWnblekRM=;
        b=HWYpJUeaMl+bTiPx9rgFcO+hwBK4/gsJB12EGibakWESdeyibdk05BUo8vaLQg+vSN
         /iWeMFp0LXyQp2mYICfkC7wYIV+aUyXx4EgztB69xgEgxkPcBlI6AxFfezzjv5KObaSC
         aWECEzISe4q/WvRQmgMm65HSMpou/dNmBtgRZxEqvwKtzuSTz6nk0rfPEFXEl9yt6Oec
         SHsH2/Dq5q3SZh4zr1/RP+u13VwDrkQY2hR8bXs5KGiaHDkt/7FsB/hYM1u4oHbKi8h4
         ZjJFTHNQwkUwDSnBwm6jD/Hxh5sEHKc6MNudmq2FcD7po0GKoI3NfHXU+qcFzNz7Xv8Y
         JQKw==
X-Forwarded-Encrypted: i=1; AJvYcCVt9apDszqS7/giqX7iis6M96smEVl9+0wUFJdIjaVTrSJhqi1RtvVb+8tBU46n1H5YaAPCVDMg7YQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YxTIAppYsEJcclOtMbUkaz3ieQ4TezPHC/SK05IlZdnLM0ibKnt
	ZaiF2yRfSERX1UiXoQAHL0xJmpVy5MvW+jqDXiWP7qdsxWetvgEzGypIvjLByQ3QEnc=
X-Gm-Gg: ASbGncuFNRtc8osSAAMRHA9SYpdgXYf0ChCWYAgSIq0nSn/VylrQVy7S+Vtsp4sH2W0
	KIP09beD9Iu5JV/65TD/EMlqWQqVGXYB9TtwmbhE90fIozjiwhrT5Yz9MjtrWOX9jbvEOZXil0K
	rWxLih1eV6FFkWYUnczLPhk+Euq8WYAfsBsxe8D+QJKFnlZ2FKb0ZxqX6d3U1JUJDMtGJeGIPcF
	prnSiaN7NBiiJ+5kChOARNZNdqLgyg+bZ3/Rl+y2w2CNb7vFx+pZ/VIWW1mRwlEZR/uFNBIL3fL
	zhXX+RfniMvMBsagWRb9o2oK7ZifX/aEURVjz4Gk9oYnyzVvvzamaXCtslX0hgYXmLvmLUEGPxK
	RT6mI5tHtqkCFbfH2HjJ5SEsfNVdJ1ahe/q1IcScyEoO2nacwYqqYg9iEjsBiXMWfj5tD8khNzQ
	os5g==
X-Google-Smtp-Source: AGHT+IEODfvwb5pfwuf07/7BgxL7RSFULYHKMVXim/bkMFn6PNQfO0GidXVfqXPLiGrqOGyZUphFPg==
X-Received: by 2002:a17:907:7246:b0:b3a:8070:e269 with SMTP id a640c23a62f3a-b766ef1d667mr2296635866b.14.1764153979891;
        Wed, 26 Nov 2025 02:46:19 -0800 (PST)
Received: from localhost ([151.37.182.223])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7654cf0435sm1840392866b.4.2025.11.26.02.46.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 02:46:19 -0800 (PST)
From: Francesco Lavra <flavra@baylibre.com>
To: Dipen Patel <dipenp@nvidia.com>,
	timestamp@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] hte: tegra194: remove Kconfig dependency on Tegra194 SoC
Date: Wed, 26 Nov 2025 11:46:18 +0100
Message-Id: <20251126104618.4117083-1-flavra@baylibre.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: timestamp@lists.linux.dev
List-Id: <timestamp.lists.linux.dev>
List-Subscribe: <mailto:timestamp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:timestamp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1286; i=flavra@baylibre.com; h=from:subject; bh=diA+OAr/q4QiqrjbEaPa6xxMoHhruPZ95mDGRkWCNGU=; b=owEB7QES/pANAwAKAe3xO3POlDZfAcsmYgBpJtpznpsthPnZtWYH+laAMxLXg1GwJGNlTdz3F GCgT9bKCl2JAbMEAAEKAB0WIQSGV4VPlTvcox7DFObt8TtzzpQ2XwUCaSbacwAKCRDt8TtzzpQ2 Xx/8C/0Yt1u0Lw6sQoiLWGeAq4QVRVzR9MpOgAg30EVKS3BFnI7brbb+lwMoEu//Rfmkz59G9sn /p3GaKVNYE+dXLmNobBYh3IkQLirF9Slt2YPMl8eEoi1P8/Ygk7WxNEvQ2dAlZ7UMRaptLKITU+ BMBjfye7D5hziOSC/mXQu7fS4aEjWeMG9kt2FaXPd+rxAAwK+KgWLg4JD6muMdVlgn4FOf5ipFl Gcxhdo1ytwpQmIIAkndTUnzod7XTgYtsgYkR6BLFLWssp2dMI+ZPV8Rkk09NiNY9N8bor4IHhBS OYHfX3QFu53b3JSetMRW+XtbPB3oSCLPj8coxvvr/L4qEg49CyCKHdhu5zOU/mn1QSUxbRcebhS rkyZF6zGavm3DkZzsFVrOv2sLuSM3Z/iQZw0lqv1JQSz9Sj9z2jBAac+gs5CW1EWRNrDQtqZA8u 14aKZB6qSDP4EV1C7RtcPaO/MBVYCin1eFRpW3bFgIvmlF2XrvTvW7iSy+6gAvMIybz+c=
X-Developer-Key: i=flavra@baylibre.com; a=openpgp; fpr=8657854F953BDCA31EC314E6EDF13B73CE94365F
Content-Transfer-Encoding: 8bit

This driver runs also on other Tegra SoCs (e.g. Tegra234).
Replace Kconfig dependency on Tegra194 with more generic dependency on
Tegra, and amend the Kconfig help text to reflect the fact that this
driver works on SoCs other than Tegra194.

Fixes: b003fb5c9df8 ("hte: Add Tegra234 provider")
Signed-off-by: Francesco Lavra <flavra@baylibre.com>
---
 drivers/hte/Kconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/hte/Kconfig b/drivers/hte/Kconfig
index 641af722b555..f57bad67deef 100644
--- a/drivers/hte/Kconfig
+++ b/drivers/hte/Kconfig
@@ -16,13 +16,13 @@ if HTE
 
 config HTE_TEGRA194
 	tristate "NVIDIA Tegra194 HTE Support"
-	depends on (ARCH_TEGRA_194_SOC || COMPILE_TEST)
+	depends on (ARCH_TEGRA || COMPILE_TEST)
 	depends on GPIOLIB
 	help
 	  Enable this option for integrated hardware timestamping engine also
 	  known as generic timestamping engine (GTE) support on NVIDIA Tegra194
-	  systems-on-chip. The driver supports 352 LIC IRQs and 39 AON GPIOs
-	  lines for timestamping in realtime.
+	  and later systems-on-chip. The driver supports 352 LIC IRQs and 39
+	  AON GPIOs lines for timestamping in realtime.
 
 config HTE_TEGRA194_TEST
         tristate "NVIDIA Tegra194 HTE Test"
-- 
2.39.5


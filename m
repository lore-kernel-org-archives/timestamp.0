Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29678266EFB
	for <timestamp@lists.linux.dev>; Tue, 18 Feb 2025 10:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739874409; cv=none; b=HsmF6lNxEuULCkZP64qDyOO90b6OfBbhUxPtgQKBUBEBleOrvwPYgRwVcdB6Gdal+J5aVzdJtUtZLjOOcdFVD+VYPYN1JcZT4cC2R7FZ/8nnLIe1CkOqkZgNU7WETWPNZ+KOT7HOoWCzs+U9B3K/+mozTH91dbC+U3etcn+FNLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739874409; c=relaxed/simple;
	bh=R0qIYgCeEQo9kJBLh0KVPhAphFigMXsi3VlgZ5rPKEc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eUGV01IN6YVo2Dfr/AUKOqVltH2gxQIXzLmuhbMfEq4tEmwdLa17+931VCLK67c9B7jBz7nXqy3PgKeIH4SazIocl7NEi6V3ITnwo2pr0VC4womXjJQq0PM6VCiU85xvSZYWuuR3w1bUv/1epLSVPMFS3H5tYq8q1bJzW45l6L4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=rETCPqs7; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="rETCPqs7"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4395dddb07dso54867195e9.2
        for <timestamp@lists.linux.dev>; Tue, 18 Feb 2025 02:26:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1739874405; x=1740479205; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PVuCVswV16narj821ZS0eMp6ZNcBSJyZmwp0vTbPAms=;
        b=rETCPqs7+HR53Mkc4XRbUFqJxUPiFmyX+m7nXg5hwTytF6/XuCiMJWKvtOBHNQiP6h
         W2QGvmQHV8UaGwYn3Abw99I0f28pDCKYO6oIrOGHxRwlc7JnF3D4ZxopFP3reIxRTX6l
         kNxVDUcJDEAMT72+ypRdGOIvcaVLb5TA4qhhCcHaNfW/mXgl9Sa1NjfwdCOh/ZvASRLi
         IASy0LeVfJb1A4q9vNBrlfFKGDmtRVAetC/n7irde9XLzTFdRTym/3qk+xrcpEtskGCH
         7vvLxuD3eEHCOhmUHwlSn9vHFFibFOPOPUZHO92KFB//yiU1EH2YWg5zyutd6Gvoihh2
         MUgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739874405; x=1740479205;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PVuCVswV16narj821ZS0eMp6ZNcBSJyZmwp0vTbPAms=;
        b=eILKrDezRBGHs8ICuzhRqZhErZhUbMHAYhrNylb7EKiN7ffJaEm4JXGcXkM9KPP9Jj
         4dxIhllwAbf4UfpTFUSKY52jcYemsLvAijVVfmNb8hvolYYlYI9pDeuyorxLfqkiiytZ
         3j7RyqHPBYNdZkMbheH9AjeIDJiRiPbgTK68AN74kyphGlwLDwd+98Xv5uEnaTYc9fCK
         o1AdNwik5yHGqQrG0OmfTxWIpFiofesMfKuCU3JmvU3eCZScCpDAUbFOqUHsvMmbeKNQ
         48t2/y3q0k0JtYR+hBOKN3ec6W5Pd4uzk3+L4dyJ+Wt1tSUcqA4swNKDO9KWb9dsSZLy
         IeBg==
X-Forwarded-Encrypted: i=1; AJvYcCV9hBZp2o+WWz+6+9H+QNLCAf6tFyh6EQimvASt1Ic76sBGqybPUEHJDTtcl/BY+D7Tn+Xd4py798U=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx/ohaOGCsBan7Tyf74trOFLRItkMLSFl+Mdh16ayut0+gmoHWx
	+Tlrg9EGsvlWlKrHF+UtRX7NTAsMj3Uz5YiJdhoYBr4scr0j19d3fvpZNDRoIZo=
X-Gm-Gg: ASbGnctxb6jme9T2duRik1JO5LanviUV99kjK4i4OGSTxlAsCA16FhkMvhQ0BSXPhCE
	HDFaH8LXerEIDhuZmzvFrl0dGS2wcnOEGkgj6FNOT6NdH20xz8+noGY32H4Gr4Q6t3FO44kMadh
	PT12ZHOo9KE93FmhGUp+Z04rdnCrunEl+T23C3clC84feOOJxsL83Qt3QKRQWVRDTEsopIFXbCF
	UGkhsZ6MGVLBuN2WarSY6Uggim0mk2ETbkuzAJf2ehpl8m1DDe5cYijTCVNu7Lp2Iq6SN8pMCfT
	N2UXIVjITVGGGlM=
X-Google-Smtp-Source: AGHT+IHYrr9CR1u4TX/WgIeANFN3wkpU/AOROz4viH7ujGhFJvNwmMI6SzTG4mXB4Ko99gH55l7OkA==
X-Received: by 2002:a05:600c:1d04:b0:439:5f7a:e254 with SMTP id 5b1f17b1804b1-4396e745a72mr106742665e9.21.1739874405324;
        Tue, 18 Feb 2025 02:26:45 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:30b8:840a:cf5e:6adf])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439618262d3sm145793195e9.22.2025.02.18.02.26.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 02:26:45 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Dipen Patel <dipenp@nvidia.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	timestamp@lists.linux.dev
Subject: Re: [PATCH v4 1/2] gpiolib: move all includes to the top of gpio/consumer.h
Date: Tue, 18 Feb 2025 11:26:43 +0100
Message-ID: <173987440185.24201.6935199130548694687.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250217103922.151047-1-brgl@bgdev.pl>
References: <20250217103922.151047-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: timestamp@lists.linux.dev
List-Id: <timestamp.lists.linux.dev>
List-Subscribe: <mailto:timestamp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:timestamp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Mon, 17 Feb 2025 11:39:21 +0100, Bartosz Golaszewski wrote:
> We have several conditional includes depending on !CONFIG_GPIOLIB. This
> is supposed to reduce compilation time with CONFIG_GPIOLIB=y but in
> practice there's no difference on modern machines. It makes adding new
> stubs that depend on more than just GPIOLIB harder so move them all to
> the top, unduplicate them and replace asm/ with preferred linux/
> alternatives.
> 
> [...]

Applied, thanks!

[1/2] gpiolib: move all includes to the top of gpio/consumer.h
      commit: dea69f2d1cc8d9ecdc72ba350d10a1e71940ef18
[2/2] gpiolib: don't build HTE code with CONFIG_HTE disabled
      commit: 63cdf6241ac7edd94cb4cd9a8f1ba2c3c61ed219

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

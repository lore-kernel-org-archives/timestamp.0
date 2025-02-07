Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE6FA19F13B
	for <timestamp@lists.linux.dev>; Fri,  7 Feb 2025 08:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738917188; cv=none; b=WLrP+mtv7GBdkOY0mCBziyEcVLx2x65wYM+zvryf+otXaC5h8h8QKmWW7AHvWRBnLePAU+fo8GmlUrwnhLHBq/t2IINJqiUnWtXxVS/p2F6jPK+6uaqXTzmzwsDGRqoeIno4tO7U10J3ZIaQEDLMa/7rYI9cwA2KnBooQvY/PME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738917188; c=relaxed/simple;
	bh=FDZ31Nx3civlmwWIQQAP+ROKkOH2EWUR9BDacWGiMAk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EKB5LKnrB0vCL2aVPBso+1gsLTtd/ksu1YLINelWSMMA+tH0MzljtL4SyiFU3LWb+yDos+inuFhh+UH0vbo233w2jcQIIYxlWu1h7J6g7xdHFB7B7MYL1+jPKbFmc5FjupqkkvvUlfzfjTa/Xv3ocWtfDUa6m/IUGXt+GezNfSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=x3gtivhG; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="x3gtivhG"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5440efe97baso1954533e87.3
        for <timestamp@lists.linux.dev>; Fri, 07 Feb 2025 00:33:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1738917184; x=1739521984; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FDZ31Nx3civlmwWIQQAP+ROKkOH2EWUR9BDacWGiMAk=;
        b=x3gtivhGB4+PF1GhRGyYxdP+8h+DKM8wMjiAWjXcbdNJ691OBu184knRHaLj7deN/J
         FoInQ5GT3fQb9BcCblNmIi0L3mbCN2pSwARo/vP4UQQsWodrcB0GfmrFrfUpP+q4mRr3
         r8lIZVyYmAVjkwh1P/Wp2SpN+QWcOYKMUExG1wH3pGUUAflZ4t61ZuTabFgtncxzlM93
         oAxhX8YRV0RtzW8jYOmJYaRrXAXNBK4ji2p2eukXdZ6tWdTjR+nUQE5eAwNo87SO/7P6
         0jgORqH/IfqiqWGeYEnPEG2ndJrVtncMmTUFP1kb7PZdFfA0Bx/BBKfFf1NOowftERaI
         j7zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738917184; x=1739521984;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FDZ31Nx3civlmwWIQQAP+ROKkOH2EWUR9BDacWGiMAk=;
        b=jUcDKXzYa81WLrsZsVupEsj0Vn9+ymM063Als5T5ME/oNYc58dC2cdCh1Zej4QKX0+
         GwqGSHcGNrMkL+hKJT1ATb7rY0mirA0fA64jLsOxRl1JJtQLPaTBtrVK9pZ3MeeBNmGT
         nRhIE2L9j3L8y8DbL4AqQy9WdQaEd5GBItoXG5hHQApulaF5W1hnLur0XDOWA77n39kP
         Myvi6Fxd6aQGs1KmUcZrKwPp0UgI179o/1wEQ+qxjbT+aC8f7sxphEjiXEQMxQ5avf5y
         bkWWQmC59gVYNpk+cvlPKTXC2c+53+62xQ9a/4Ve5mEIA9SXeeNi5diHmKBx3RAjRsQo
         sdxg==
X-Forwarded-Encrypted: i=1; AJvYcCU3DjbjJ0kmZd2nXzn5hbvE4Xpk/NW8Ae2V4qU40YkSTE+bnFjpjO8Ddebsou/lpuNhb87r45m7vMI=@lists.linux.dev
X-Gm-Message-State: AOJu0YwxjR3waNXY61xaxvPPoIWpeZED46fKi+0+gFCPFMYCfB/PG2VR
	mVeljU3Mhll3e9PGLCUpL5QR5wOZs+p7j9gHpk4Ku9CMUAe2zC0uZ6U6FkIpEiZ1cENd7m88xgK
	V5nE9hg9paSkyas3TGhpqAwGeOQSBQGUrNg7E7A==
X-Gm-Gg: ASbGncs6ynmExTwmlSbo6QPFystYsJv0YnxUoCNk1azOE9Cv0+CNH6vOGLj4GP8uXEN
	KkMvgE7jlEFN+zwfk1V/EyrPUZQJBVkpGK3Z+blPjzYtdHQ67Nm7dDtjy2R3LcKlzD9eAtS+4VG
	Jh2pc73LHn9PyLwMy2cNDAORrYEJU=
X-Google-Smtp-Source: AGHT+IHgWB89hNW9OJ6NJL1Rj2tEIBIMQOYDoOww7bCgZyhnauDXQruFNOqLsaUZ2hE+SG4ZneFMitUz5QVDxTih6yw=
X-Received: by 2002:a05:6512:e84:b0:544:ebf:741c with SMTP id
 2adb3069b0e04-54414aa880emr710177e87.31.1738917183753; Fri, 07 Feb 2025
 00:33:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: timestamp@lists.linux.dev
List-Id: <timestamp.lists.linux.dev>
List-Subscribe: <mailto:timestamp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:timestamp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250207083146.17872-1-brgl@bgdev.pl>
In-Reply-To: <20250207083146.17872-1-brgl@bgdev.pl>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 7 Feb 2025 09:32:53 +0100
X-Gm-Features: AWEUYZmWklGhQOPVR4YjGZK1-XCvq6-AQnGa_lgtdadT-6hgqTW9nexvfLKNX_k
Message-ID: <CAMRc=Mcxw+O+rW4zUwM3roLxj3vAGAkepnVssyd7ifMvuuO=OA@mail.gmail.com>
Subject: Re: [PATCH v2] gpiolib: don't build HTE code with CONFIG_HTE disabled
To: Dipen Patel <dipenp@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	timestamp@lists.linux.dev, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 7, 2025 at 9:31=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Hardware timestamping is only used on tegra186 platforms but we include
> the code and export the symbols everywhere. Shrink the binary a bit by
> compiling the relevant functions conditionally.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

I missed Linus' tag.

Bart

Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83C08DF5B
	for <timestamp@lists.linux.dev>; Wed, 11 Oct 2023 05:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kZXH7XjY"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-41820eecff2so40389481cf.1
        for <timestamp@lists.linux.dev>; Tue, 10 Oct 2023 22:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697003757; x=1697608557; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mTjpQvyMHkbUpLu3ihyopH9dpMDT8ryAdeqR+3nM3c0=;
        b=kZXH7XjYEyeIHxqyag9IOdGt3/iNZuKDWJW0Osc9s5F8Z7IBROYVSRNClbqAoi8Mgw
         rHj2Phbq+d0t5Xec9LRjPu61bLm7w2G5rIXlI2xWSi1XKiS+0PvuvwuSQwOTaOIh09SM
         ZFsuj0Kxe2eekVPGCoh7uWEK4iIcWhLJj4Bv1kV7sO/0JYt9ZQUjvXlnwAqGalBmvveL
         0ySAzZeBWwALiYIXXlnftcgU1Xki+pLYduZ3FcMvQALYic7UctTKyIFPou8Pk0yndRCs
         GludFDXGDIuj23lGbA0a/sTN3MVY/lB0E7epJvggeM+ak5htheCwE0XHDMUcqNqP/xDR
         0Rpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697003757; x=1697608557;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mTjpQvyMHkbUpLu3ihyopH9dpMDT8ryAdeqR+3nM3c0=;
        b=FcqwjCOq3yUdzZhpirOo7rbTTp8dECph7dVzSIg1JjES8ki8SbkLkrirDy3mCezqsf
         +OGpRnits5g+IH2uurqoXXeqO48liNjGbSwUO+ovkQYsEztt5uRooZ70zPejxpEmSCWK
         /WNVKp6aSXHKqPN5ixwM0vBI1s1VhOTHHQ4SuNG6SuChkWhJhIAiYHEeYQkS6aXVACGC
         wuiTX0YYUakRx+5olv97cwej7DAU7ENIlcjXo3vaxncjcqbpbxVXwB79GTrXhsbbidZ2
         A9sfzP9PG02NA7f8js9aAMZ+8nueUqQl4HncEOuVb+JWecNQtXiKew0ZPMfIOII6OcZW
         LgDw==
X-Gm-Message-State: AOJu0YyyfmaO1aFOIsP3raj/ZYJCqhRUr89piT6TpecWx4F8byPrzCPW
	g/mOfNTkunGdpBn3u/tKsGRp9ATDDj/8N7VKXdE=
X-Google-Smtp-Source: AGHT+IFIeFo8MDm4RDbVOvfQd2TQwRCkzHVhlunlbXpiCiir1RpoyTNxTr2ClGYp+hsDBzw9ZQx44MeKbyGLy1S7+ew=
X-Received: by 2002:a0c:f194:0:b0:66c:ff4f:a35f with SMTP id
 m20-20020a0cf194000000b0066cff4fa35fmr3144687qvl.51.1697003757216; Tue, 10
 Oct 2023 22:55:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: timestamp@lists.linux.dev
List-Id: <timestamp.lists.linux.dev>
List-Subscribe: <mailto:timestamp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:timestamp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231010151709.4104747-1-andriy.shevchenko@linux.intel.com>
 <20231010151709.4104747-5-andriy.shevchenko@linux.intel.com> <0db37cd0-9cb9-41bc-c2aa-0a01c0295ed0@nvidia.com>
In-Reply-To: <0db37cd0-9cb9-41bc-c2aa-0a01c0295ed0@nvidia.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 11 Oct 2023 08:55:21 +0300
Message-ID: <CAHp75VcRKnWRNxTafsG2f+tWrF-6yQjECLpyn_S-VK78SfL8VQ@mail.gmail.com>
Subject: Re: [PATCH v1 4/4] hte: tegra194: Switch to LATE_SIMPLE_DEV_PM_OPS()
To: Dipen Patel <dipenp@nvidia.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, timestamp@lists.linux.dev, 
	linux-tegra@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 10, 2023 at 10:36=E2=80=AFPM Dipen Patel <dipenp@nvidia.com> wr=
ote:
> On 10/10/23 8:17 AM, Andy Shevchenko wrote:

> > +             .pm =3D pm_slee_ptr(&tegra_hte_pm),
>
> typo, pm_sleep_ptr instead?

Indeed. On my x86_64 this code slipped from compilation. I will try
harder to compile-test it next time.

--=20
With Best Regards,
Andy Shevchenko

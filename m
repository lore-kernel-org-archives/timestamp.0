Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04C45354F0
	for <timestamp@lists.linux.dev>; Wed, 11 Oct 2023 05:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jmStfOkL"
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-7b0a16f0338so2750148241.0
        for <timestamp@lists.linux.dev>; Tue, 10 Oct 2023 22:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697003686; x=1697608486; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DiBJtKSXozbM0r46s6SPSgE4x00q8wuaRms3SXA5/DM=;
        b=jmStfOkLUMz9+hyezroDcBdOCHZYcNrLa7YGnvQpx13SuMT6ad5xVl9GbtoULLJMze
         ewNleFAOT4yE15pviC/jpgSnZVyD80/FK6qLPbiOhsV/0thB0PlBM57JF/0bzdcMBnsP
         A/0KOiRMMRWhDmKNFurVPKrQieW6PsGIuAj6lzO5eXN/e92P7CVLD2rYSpOOOrdglq9e
         WBCGxxqFO60JzJlIbwZi44p/zPCMWUwL/3EBwlZF4sYNjlYiJ9Zr37r86Jwo+mHDzTkd
         xdlOKnwOWbNzpxcsrTvAqN0Nf6aMBSybf43rdVL8+2vbpJChy7vbRd2z3739t7SBo+FO
         jT1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697003686; x=1697608486;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DiBJtKSXozbM0r46s6SPSgE4x00q8wuaRms3SXA5/DM=;
        b=idB3j7dcQP4s2pR/okXy9i5f54+TRSdeaCz8h5hprGlFWXkPJbInDfjxsNgCNbxIgc
         O2pex4G9cxeUnjlXV2/zwaXl6pK10eUYivj6bWzvIGrb65EpkOIYMg5SSRg+Fzy0rhtu
         QtleEwdu6+OLvtwfbhJCqiYOGlPrdpn1RZBH4V1v3qcMLxl0pqW3R+5p63rP2SOHX8u9
         AANGiQXOAEMkv3Wv6DCLXjVMDtwuQZWE2zHvCRXPb4IK9jgPt2mxY8y58Ybi1s83/k54
         6/wd7G0gF0ivQ/awnmLDdAMKbWeumtahblg9wKMPjzLy0JuHlOYYpoWPIJ/i8mmnuKIx
         9png==
X-Gm-Message-State: AOJu0Yz4iE9bC++83bgwOEDuHrhUJqQ/UE+10xRDZWvYaP1h/7UWAbWn
	z5QPrr1VbjAV7QVSbaWSmXZ0S7+MAejiaTrYR9o=
X-Google-Smtp-Source: AGHT+IHA9B34pMhcmDUBfDewbK1peGnr0ieNQbmb7QYwL7I9suY7sO1Vkh0n8/Iorr3X+CjyMV9ta3PrINSdPOu6mrE=
X-Received: by 2002:a67:fe88:0:b0:44e:9313:b045 with SMTP id
 b8-20020a67fe88000000b0044e9313b045mr19458526vsr.7.1697003685723; Tue, 10 Oct
 2023 22:54:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: timestamp@lists.linux.dev
List-Id: <timestamp.lists.linux.dev>
List-Subscribe: <mailto:timestamp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:timestamp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231010151709.4104747-1-andriy.shevchenko@linux.intel.com>
 <20231010151709.4104747-3-andriy.shevchenko@linux.intel.com>
 <3e1e6acf-5862-9f35-cbe6-72bb17cf3851@nvidia.com> <147fe15c-13d3-60dc-bd49-cd0cb40126e9@nvidia.com>
In-Reply-To: <147fe15c-13d3-60dc-bd49-cd0cb40126e9@nvidia.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 11 Oct 2023 08:54:09 +0300
Message-ID: <CAHp75VdgM0riV6Y2PHnU14ZTN_4-eiXevFhi-gsbQPwrkicArw@mail.gmail.com>
Subject: Re: [PATCH v1 2/4] hte: tegra194: don't access struct gpio_chip
To: Dipen Patel <dipenp@nvidia.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, timestamp@lists.linux.dev, 
	linux-tegra@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 10, 2023 at 10:31=E2=80=AFPM Dipen Patel <dipenp@nvidia.com> wr=
ote:
> On 10/10/23 9:19 AM, Dipen Patel wrote:
> > On 10/10/23 8:17 AM, Andy Shevchenko wrote:

> >> +                    hte_dev->gdev =3D
> >> +                            gpio_device_find_by_fwnode(of_fnode_handl=
e(gpio_ctrl));
>
> I think there is typo for of_fnode*. Should it be of_fwnode*?

Yep, it's a typo, can you. fix manually for the test, please?

--=20
With Best Regards,
Andy Shevchenko

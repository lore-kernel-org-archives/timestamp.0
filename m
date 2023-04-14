Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 522227C
	for <timestamp@lists.linux.dev>; Fri, 14 Apr 2023 10:43:44 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id i3so7716038wrc.4
        for <timestamp@lists.linux.dev>; Fri, 14 Apr 2023 03:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681469022; x=1684061022;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gNgu8/gxif8nw/9Y5K0MGzuFATQ+lD23DX1qBxOYNkg=;
        b=ntAbmdAOB87jM3sQ1csEnjg8Ag2twQ61Xl4Zun8ptqhKrtHZW0l/Ym/JRVy/wivAxG
         0iCwa+T0dMBud5YuzRit4k36il2soQGcLf8+/lK+bAayzf6YbqTpFHjUzh6Pc8CdHOz0
         WaDKsMNbgOaUnSfDKFLcPlvEcLb6kEvQCZyrXH4MFDxPrddhS4olJZScbQFnISQmZB6f
         omhoUqu8q9HF84Z17yIRcStxAYWiyOPDHkj1IPBOf1pMpcjVsHrtKEDRPSmUl4zC/nIU
         g5VHTYWrGX8fl4wNdWzKP+NmClpjAcONTGZa0Mm+7qA35L7WkTGYe3InJ+adt4e2hXjc
         O7uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681469022; x=1684061022;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gNgu8/gxif8nw/9Y5K0MGzuFATQ+lD23DX1qBxOYNkg=;
        b=YkAij2lHRMJe8L1ZtSGk5S8LPq9VPY8qNL5JFvgYpaFWkJjEkR7aFdidMHt4Q9tOF8
         w7R65aAud22aNBVTRfCRMSlFug2wA4la8pDAsOWKQaoVTc7HiBWfdNNK9pjTu4MIPTbh
         g6p4tJMxWxG/58CjKObFdSBDUcf7RXu3+ldG862C6dXOjAXygI9eVKuPgTW5Hni7/E4B
         gDPEibjm5AFP1n4uwE9bTkusycX0rhEN/TzB2fwgUZEwassAZNluiNnz650+/pC9XmpR
         f74K3OL1UAy9tJZEcMmQRsEY/xCWTOfzMj2rZ1IgT9T5MVCyYmqW/XtDuQLfgz20Cviu
         wr2w==
X-Gm-Message-State: AAQBX9cqN4jDP9qP2QR4pFAX7WIpuCFno4tiBokd7AbVXnNFWKvpC11Z
	Fz/vl0yI8NJXqJ7P3Hbiclp5z6RaQUeJ2RoFuUc=
X-Google-Smtp-Source: AKy350a9U4k0Iy7pNu4JvvfTjZIpwao5lJtg7D3YdN7kFR3yOSYuAwqTS/atSnBgWjuR+uOrNsHldqse3GCOgZDpLYk=
X-Received: by 2002:a5d:4248:0:b0:2ce:ac97:6f51 with SMTP id
 s8-20020a5d4248000000b002ceac976f51mr927213wrr.13.1681469022498; Fri, 14 Apr
 2023 03:43:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: timestamp@lists.linux.dev
List-Id: <timestamp.lists.linux.dev>
List-Subscribe: <mailto:timestamp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:timestamp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230414004455.19275-1-dipenp@nvidia.com> <373eacb8-be3f-6b95-3e08-f0ff36f79891@linaro.org>
In-Reply-To: <373eacb8-be3f-6b95-3e08-f0ff36f79891@linaro.org>
From: Thierry Reding <thierry.reding@gmail.com>
Date: Fri, 14 Apr 2023 12:43:31 +0200
Message-ID: <CA+PwDYeTkWp9vXMec99H2OKOGhx0mOrnthT08=JkMkEsi4NDPw@mail.gmail.com>
Subject: Re: [V6 0/9] Add Tegra234 HTE support
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Dipen Patel <dipenp@nvidia.com>, jonathanh@nvidia.com, linux-kernel@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linus.walleij@linaro.org, devicetree@vger.kernel.org, 
	linux-doc@vger.kernel.org, robh+dt@kernel.org, timestamp@lists.linux.dev, 
	krzysztof.kozlowski+dt@linaro.org, brgl@bgdev.pl, corbet@lwn.net, 
	gregkh@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"

On Fri, Apr 14, 2023 at 09:36:15AM +0200, Krzysztof Kozlowski wrote:
> On 14/04/2023 02:44, Dipen Patel wrote:
> > This patch series mainly adds support for the Tegra234 HTE provider. In
> > addition, it addresses dt binding comments which prompted code
> > changes in the existing HTE provider driver without breaking the
> > Tegra194 provider. The comments raised concern how existing code
> > retrieves gpio controller node
> > (the node is used to help namespace conversion between HTE and GPIOLIB).
> > To help simplify that process, new DT property is suggested which adds
> > gpio controller node in the HTE provider binding as phandle property. To
> > conlude this patch series:
> > - adds Tegra234 HTE provider
> > - modifies existing provider code to address new dt binding for Tegra234
> > without breaking it for the Tegra194 chip.
> >
> > The V1 patch series:
> > - Adds tegra Tegra234 HTE(timestamp) provider supports.
> > - Updates MAINTAINERS file for git tree, mail list fields.
> > - Updates devicetree and API documentations.
> > - Enables HTE subsystem, Tegra194 and Tegra234 HTE providers
> > by default in arm64 defconfig and dts files.
>
> All your emails miss PATCH prefix. Use `git format-patch` to generate
> proper versioned patch. Stripping important part messes up with our
> filters. We have quite a lot of emails, so proper filtering is important.

I used to get this wrong as well because I didn't know (or perhaps it
didn't exist yet at the time) --reroll-count|-v and used to manually
override --subject-prefix.

Thierry

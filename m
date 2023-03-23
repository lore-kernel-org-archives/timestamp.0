Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65F1E320A
	for <timestamp@lists.linux.dev>; Thu, 23 Mar 2023 08:38:04 +0000 (UTC)
Received: by mail-yb1-f181.google.com with SMTP id p204so12776624ybc.12
        for <timestamp@lists.linux.dev>; Thu, 23 Mar 2023 01:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679560683;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uq8iULvcx+/Gb+0OFAUtoLewabyi+bElNPlA9W28jjU=;
        b=QE23HGJQHnGAd09QtB+TQS3Q2R0AzQuCJycDS0LJ3CvnhtMzqkExBmjQuj/DUSULwW
         CdTUyRpJfr0BxLeiqJk77HGiEpcXePcfNRVwAuvI4fjDQMcfKVbD5YDefCwoepOjxwZs
         CRKobbEslFR4+47TabRND3zS6BWHhNJQPmXbEQsdpKGm0+ZIf0RjTtSzFo1V0GM4z8iO
         t8YpWg2zcFpkTKc8apwndzQ5TnHNOY/z+enoDLOK1JvEzONxhz0ECaTqBZ98ytvb76mU
         C7s7uOR2SKQANO394Ed6N34I7/1N8dPGan68/QCltgPt0qY65XouFSoJLketbqzkmIx8
         o4BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679560683;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Uq8iULvcx+/Gb+0OFAUtoLewabyi+bElNPlA9W28jjU=;
        b=GLpFNsZlRW21JgotQxOlqtGbJbkb304oQIBLXYu5M2GqlrfTsnDWFMk1QoeXSf80Yh
         GumxHc1BNeKReMOEw8JZmYC/pZ0/4+ENa0Lyvx0ezEdYd0q5yFPGn+BDuKJbO3NAP2GG
         y3/miskZIXi4QOJ9ksZBIyYy9IMuVTE8JRHN8LrGBd2HzNdV5I8LgGtg0Wk7+ZyY/beK
         vZ/WpSicz06IzJwW7jV/IUncOX8FdRRAHZg3VgQ0JAG1Q8pq/gDZzbiBg/tE8iW7jDjE
         KhGg4FBU1F6Dzox/tP6dd0lCJ9wVYTvaRFdLWrIfN7uYrwSn5nUierrXQsmWCCexWtj8
         slvw==
X-Gm-Message-State: AAQBX9dLiJ9PYwbWqM2P12VwUjHGY9qAV4sDwsBv5Q9q86QIm+l56EVG
	itsBdVDqGY8F+EYdSSXuG5JFbhQ+8xyhhq87TfrV0A==
X-Google-Smtp-Source: AKy350Y1PGIFybckLNdnrmn7B3+z+PO42zpuO3LlrftnXKkUHf5Mxe7g7DsahcR71Hcc5jkg0FrjjJg/mpuCBsLCn1U=
X-Received: by 2002:a05:6902:124a:b0:b74:77fa:581d with SMTP id
 t10-20020a056902124a00b00b7477fa581dmr1459338ybu.4.1679560683403; Thu, 23 Mar
 2023 01:38:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: timestamp@lists.linux.dev
List-Id: <timestamp.lists.linux.dev>
List-Subscribe: <mailto:timestamp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:timestamp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230323012929.10815-1-dipenp@nvidia.com> <20230323012929.10815-10-dipenp@nvidia.com>
In-Reply-To: <20230323012929.10815-10-dipenp@nvidia.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 23 Mar 2023 09:37:52 +0100
Message-ID: <CACRpkda9A-1qKqUPMC=9JKN5uotUmTt2CGQZv5Z91wgrSmwtHw@mail.gmail.com>
Subject: Re: [PATCH V4 09/10] hte: handle nvidia,gpio-controller property
To: Dipen Patel <dipenp@nvidia.com>
Cc: thierry.reding@gmail.com, jonathanh@nvidia.com, 
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-doc@vger.kernel.org, robh+dt@kernel.org, timestamp@lists.linux.dev, 
	krzysztof.kozlowski+dt@linaro.org, brgl@bgdev.pl, corbet@lwn.net, 
	gregkh@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 23, 2023 at 2:29=E2=80=AFAM Dipen Patel <dipenp@nvidia.com> wro=
te:

> The dt binding adds nvidia,gpio-controller property from Tegra234 SoC
> onwards to simplify code handling gpio chip search. The gpio chip search
> is needed for the AON GPIO GTE instances to map the hardware timestamp
> GPIO request (coming from the GPIO framework) to the tegra HTE
> providers. The patch also adds new gpio chip match function to match
> from the fwnode instead of the gpio controller label. The addition
> of the property does not break ABI for the existing Tegra194 code.
>
> Signed-off-by: Dipen Patel <dipenp@nvidia.com>

Yups just like this!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2775611A
	for <timestamp@lists.linux.dev>; Wed, 12 Apr 2023 14:24:59 +0000 (UTC)
Received: by mail-oi1-f180.google.com with SMTP id bl22so25768159oib.11
        for <timestamp@lists.linux.dev>; Wed, 12 Apr 2023 07:24:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681309499; x=1683901499;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zL+50zPLrjuLA8fqBLOEQM7c2a2HckTPPr7Ny3uRBP0=;
        b=Qhqm9AWTmijqaqkGNXj6fYoN7c8BxT7K1+M7xPWTxRygFO5YsxNcMXfdd954VXyHlw
         Ff9JvsIz/hn93QzoX0GLlg+rOmuFR+5+dPV7dfUS0faooyeFiFOjBCRawfYteaOnLS9F
         KvjNDG/yUb2a+DKYjbVQBp2OjweIk2Vayg8PTOS6O7xFq7FkvPsj+UH2rVLn0Xr0l7Gc
         taEmeeiT/FmhrwCP5jN1qR6EPC52c6tu4vfhf9qeOiD0gp5PC0JktLeOxsPiA4IJFkMC
         T9jjaHQyxQ4wjl/WEWN4Gcvyqu5CXcGIo0ltwdz4OylknUB35Qc5Iogz3qAR/vekAQO0
         IgsA==
X-Gm-Message-State: AAQBX9c7tDcaY+7jOPFQom0UUVjbsFxFsS6Khw+7g0Z7XBX/fMUTgzAI
	qo9R9r0+pI3uN4mHhVVcfA==
X-Google-Smtp-Source: AKy350ZRWCnOuzOVFhOnHWoQ1lacuWyjXo0ay+clioHA9u4vMZliLv5kBRkMbBNTgscun57W5oShRQ==
X-Received: by 2002:a05:6808:88:b0:386:ea33:755b with SMTP id s8-20020a056808008800b00386ea33755bmr1083158oic.19.1681309498919;
        Wed, 12 Apr 2023 07:24:58 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id b124-20020aca3482000000b0038bc0cb5d52sm3498572oia.9.2023.04.12.07.24.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Apr 2023 07:24:58 -0700 (PDT)
Received: (nullmailer pid 2312911 invoked by uid 1000);
	Wed, 12 Apr 2023 14:24:57 -0000
Date: Wed, 12 Apr 2023 09:24:57 -0500
From: Rob Herring <robh@kernel.org>
To: Dipen Patel <dipenp@nvidia.com>
Cc: linus.walleij@linaro.org, jonathanh@nvidia.com, devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org, brgl@bgdev.pl, robh+dt@kernel.org, gregkh@linuxfoundation.org, linux-gpio@vger.kernel.org, timestamp@lists.linux.dev, linux-kernel@vger.kernel.org, corbet@lwn.net, linux-tegra@vger.kernel.org, thierry.reding@gmail.com, linux-doc@vger.kernel.org
Subject: Re: [V5 03/10] dt-bindings: timestamp: Deprecate nvidia,slices
 property
Message-ID: <168130949723.2312853.9364535944152473595.robh@kernel.org>
References: <20230406171837.11206-1-dipenp@nvidia.com>
 <20230406171837.11206-4-dipenp@nvidia.com>
Precedence: bulk
X-Mailing-List: timestamp@lists.linux.dev
List-Id: <timestamp.lists.linux.dev>
List-Subscribe: <mailto:timestamp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:timestamp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230406171837.11206-4-dipenp@nvidia.com>


On Thu, 06 Apr 2023 10:18:30 -0700, Dipen Patel wrote:
> The property is not necessary as it is a constant value and can be
> hardcoded in the driver code.
> 
> Signed-off-by: Dipen Patel <dipenp@nvidia.com>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  .../bindings/timestamp/nvidia,tegra194-hte.yaml           | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>


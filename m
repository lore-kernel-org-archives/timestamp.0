Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EA3120EE
	for <timestamp@lists.linux.dev>; Sat, 25 Mar 2023 11:04:35 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id w9so17394277edc.3
        for <timestamp@lists.linux.dev>; Sat, 25 Mar 2023 04:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679742273;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YGuQcUMPAohDQdYCn6esi5t8mBDfcwG+UMgt1Vpx+WM=;
        b=pMAvRb8aCJ2b0iCd+bQbJvnxrHmZdtK2pRSRcgh8uUGqvblJeke1gYjt2UVdKTPv2T
         tE/Jx7SUB3KniKeL3tXU9iLtWMVaVOQn2bD0tkfIwL+eY/NlNpJBI/hXmIDAh8bMyaYI
         HxIWizm/znH9TrCyib1AJNP0PMJXPbJ1I8+dxmfRO9M6mkYHa9lSvSjWmGoAta0y3o61
         RUXOIC0PIN/nYSvCp4SDQyCd2//4jjpLR3o1hFqT22PbPt8syu6kWex4RbPC1Voip8PD
         jMvgpF3URNTFFCWYZiTX/Qv30J+QbEIufaG3hIQmjufi0hl6LEfjfX2yX6SW+1o5ZMfX
         LrZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679742273;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YGuQcUMPAohDQdYCn6esi5t8mBDfcwG+UMgt1Vpx+WM=;
        b=dlr/ArCJ9eaSsf0car5JCeTyHWBFPz3deJ2AJT8UrlyKvaRQzxXUzf1rG9VMZBx3U0
         Mw4Ib8kkfFtxfNY8ls6AzbEAGJsto+qGHp2ZOJEda3AvdnljYZ3/WZHD1+Rcd61zQ5mT
         440P4mfxjfWAGU7/6n5YvG3cQIzZkP/qhMY6c4tR8uNHPPx4T9CxGi93dtFSCp3eBL21
         CRHS4zoOzvf0HxUBC3YBa3HTUt3ou8rGXLVucNgKUFlBfcbGzV+HIV+Un8oj/aRHNlMR
         U4ZP1D2zWnRWog7INdmUhkDQAvKPHPiaRQHbULgqxv7FABLTTGbBZ7c0naYINamghJpo
         zkPw==
X-Gm-Message-State: AAQBX9fvNvoqlAofMBlfE7Oy7DB1s03Es46bI9TlSPxPW0kFCj+r4cai
	QVMJykabh2yCjBgpn1zC5zXD0w==
X-Google-Smtp-Source: AKy350Y/NlId/yerM/9zRTivgf+nQ019MPql1v8mGNitanGiTO1YCTgARhntB8wDoJL8eH7ILlPbiQ==
X-Received: by 2002:a17:906:951:b0:933:3cc7:4420 with SMTP id j17-20020a170906095100b009333cc74420mr5852539ejd.45.1679742273597;
        Sat, 25 Mar 2023 04:04:33 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:d230:b2c7:d55:c9c8? ([2a02:810d:15c0:828:d230:b2c7:d55:c9c8])
        by smtp.gmail.com with ESMTPSA id b1-20020a1709065e4100b008ca52f7fbcbsm11602168eju.1.2023.03.25.04.04.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Mar 2023 04:04:33 -0700 (PDT)
Message-ID: <55ab6fdb-7b93-38bb-bbf9-9d9e2051afba@linaro.org>
Date: Sat, 25 Mar 2023 12:04:32 +0100
Precedence: bulk
X-Mailing-List: timestamp@lists.linux.dev
List-Id: <timestamp.lists.linux.dev>
List-Subscribe: <mailto:timestamp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:timestamp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH V4 02/10] dt-bindings: timestamp: Add Tegra234 support
Content-Language: en-US
To: Dipen Patel <dipenp@nvidia.com>, thierry.reding@gmail.com,
 jonathanh@nvidia.com, linux-kernel@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org,
 linus.walleij@linaro.org, devicetree@vger.kernel.org,
 linux-doc@vger.kernel.org, robh+dt@kernel.org, timestamp@lists.linux.dev,
 krzysztof.kozlowski+dt@linaro.org, brgl@bgdev.pl, corbet@lwn.net,
 gregkh@linuxfoundation.org
References: <20230323012929.10815-1-dipenp@nvidia.com>
 <20230323012929.10815-3-dipenp@nvidia.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230323012929.10815-3-dipenp@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23/03/2023 02:29, Dipen Patel wrote:
> Added timestamp provider support for the Tegra234 in devicetree
> bindings.
> 
> Signed-off-by: Dipen Patel <dipenp@nvidia.com>
> ---
> v2:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

